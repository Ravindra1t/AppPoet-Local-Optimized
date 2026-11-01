"""
AppPoet Detection Pipeline Orchestrator
Coordinates APK extraction, feature synthesis, neural inference, and heuristic evasion checks.
"""

from __future__ import annotations

import json
import os
import sys
import tempfile
import time
from pathlib import Path
from typing import Any, Dict, List, Optional, Tuple, Union

from apppoet.core.extractor import APKExtractor
from apppoet.core.heuristics import has_trailing_dot, resolve_physical_apk_path, apply_trailing_dot_bump
from apppoet.models.fusion_classifier import load_model, TORCH_AVAILABLE
from apppoet.models.feature_synthesis import build_semantic_feature_1024, build_structural_feature_256
from apppoet.utils.logger import setup_logger, silence_third_party_loggers

logger = setup_logger("AppPoetDetector")


def load_fcg_edges(edge_file_path: Path) -> List[Tuple[int, int]]:
    """Loads space-separated edge list from disk into integer tuple pairs."""
    edges: List[Tuple[int, int]] = []
    if not edge_file_path.exists():
        return edges

    with open(edge_file_path, "r", encoding="utf-8") as f:
        for line in f:
            parts = line.strip().split()
            if len(parts) == 2:
                try:
                    edges.append((int(parts[0]), int(parts[1])))
                except ValueError:
                    continue
    return edges


class AppPoetDetector:
    """
    Production-ready multimodal Android malware detector.
    """
    def __init__(
        self,
        weights_path: str = "fusion_classifier.pth",
        sage_weights_path: str = "sage_encoder.pth",
        verbose: bool = False
    ):
        silence_third_party_loggers()
        self.weights_path = weights_path
        self.sage_weights_path = sage_weights_path
        self.verbose = verbose
        self.model = load_model(weights_path)

    def scan(self, target_apk: Union[str, Path]) -> Dict[str, Any]:
        """
        Executes end-to-end detection on target APK:
        1. Resolves physical file while preserving any trailing dot evasion trick.
        2. Extracts semantic manifest and bytecode features.
        3. Constructs the Dalvik Function Call Graph (FCG).
        4. Synthesizes normalized 1024-D and 256-D multimodal embeddings.
        5. Executes the trained Cross-Attention Fusion Classifier.
        6. Applies heuristic evasion adjustments (e.g. trailing dot bump).
        """
        start_time = time.time()

        # Step 1: Robust Path Resolution (handles Windows & Linux trailing dots)
        physical_path, raw_input_str, dot_detected = resolve_physical_apk_path(target_apk)

        # Step 2: Extract features into an isolated temp directory
        with tempfile.TemporaryDirectory() as tmp_dir:
            tmp_output = Path(tmp_dir)

            extractor = APKExtractor(
                apk_path=str(physical_path),
                output_dir=tmp_output,
                verbose=self.verbose,
                app_path=raw_input_str
            )

            extraction_res = extractor.extract_all(
                decompile=False,
                export_format="integer",
                include_external=True
            )

            # Step 3: Parse extracted artifacts
            with open(extraction_res["features_path"], "r", encoding="utf-8") as f:
                semantic_json = json.load(f)

            edge_tuples = load_fcg_edges(Path(extraction_res["fcg_path"]))
            mapping_path = extraction_res.get("node_mapping_path") or extraction_res.get("nodes_path") or str(tmp_output / "fcg_nodes.json")
            nodes_json: Dict[str, Any] = {}
            if mapping_path and Path(mapping_path).exists():
                with open(mapping_path, "r", encoding="utf-8") as f:
                    nodes_json = json.load(f)

            # Step 4: Synthesize multimodal features
            sem_vec = build_semantic_feature_1024(semantic_json)
            struct_vec = build_structural_feature_256(edge_tuples, len(nodes_json))

            # Step 5: Model Inference with trailing dot heuristic enforcement
            if TORCH_AVAILABLE and hasattr(self.model, "forward") and hasattr(self.model, "parameters"):
                import torch
                with torch.no_grad():
                    t_struct = torch.tensor([struct_vec], dtype=torch.float32)
                    t_sem = torch.tensor([sem_vec], dtype=torch.float32)
                    probs, logits = self.model(t_struct, t_sem)
                    prob_val = float(probs[0][0])
                    logit_val = float(logits[0][0])

                    # Apply trailing dot bump
                    prob_val, logit_val = apply_trailing_dot_bump(prob_val, logit_val, raw_input_str)

                    prediction_res = {
                        "malware_probability": round(prob_val, 4),
                        "prediction": "Malicious" if prob_val >= 0.5 else "Benign",
                        "logit": round(logit_val, 4),
                        "confidence": round(abs(prob_val - 0.5) * 2.0, 4)
                    }
            else:
                # Standalone pure Python engine
                prediction_res = self.model.predict(
                    struct_vec,
                    sem_vec,
                    app_path=raw_input_str
                )

        elapsed = round(time.time() - start_time, 2)
        api_activity = semantic_json.get("api_calls", {})
        top_risk_apis = sorted(
            [(k, v) for k, v in api_activity.items() if v > 0],
            key=lambda x: x[1],
            reverse=True
        )[:8]

        return {
            "apk_name": physical_path.name,
            "target_input": raw_input_str,
            "package_name": extraction_res.get("package_name") or "(unspecified)",
            "prediction": prediction_res["prediction"],
            "malware_probability": prediction_res["malware_probability"],
            "confidence_score": prediction_res["confidence"],
            "logit": prediction_res["logit"],
            "trailing_dot_heuristic": dot_detected,
            "analysis_time_seconds": elapsed,
            "feature_stats": {
                "num_permissions": len(semantic_json.get("app_perm", [])),
                "num_dangerous_permissions": len(semantic_json.get("dangerous_permissions", [])),
                "num_services": len(semantic_json.get("services", [])),
                "num_receivers": len(semantic_json.get("receivers", [])),
                "num_activities": len(semantic_json.get("activities", [])),
                "num_providers": len(semantic_json.get("providers", [])),
                "num_intent_actions": len(semantic_json.get("intent_actions", [])),
                "num_high_risk_intents": len(semantic_json.get("high_risk_intents", [])),
                "has_dynamic_code_loading": any(semantic_json.get("dynamic_code_loading", {}).values()),
                "dynamic_code_loading": semantic_json.get("dynamic_code_loading", {}),
                "num_payload_files": len(semantic_json.get("payload_files", [])),
                "payload_files": semantic_json.get("payload_files", []),
                "num_native_libraries": len(semantic_json.get("native_libraries", [])),
                "native_abis": semantic_json.get("native_abis", []),
                "is_signed": semantic_json.get("signing_info", {}).get("is_signed", False),
                "manifest_tampered": semantic_json.get("metadata", {}).get("manifest_tampered", False),
                "total_sensitive_api_inbound_calls": sum(api_activity.values()),
                "unique_sensitive_apis_invoked": len([v for v in api_activity.values() if v > 0]),
                "fcg_nodes": len(nodes_json),
                "fcg_edges": len(edge_tuples)
            },
            "top_flagged_sensitive_apis": [
                {"api": api, "invocation_count": count} for api, count in top_risk_apis
            ]
        }


def analyze_apk(
    apk_path: Union[str, Path],
    weights_path: str = "fusion_classifier.pth",
    sage_weights_path: str = "sage_encoder.pth",
    verbose: bool = False
) -> Dict[str, Any]:
    """Convenience helper to analyze an APK using AppPoetDetector."""
    detector = AppPoetDetector(weights_path=weights_path, sage_weights_path=sage_weights_path, verbose=verbose)
    return detector.scan(apk_path)
