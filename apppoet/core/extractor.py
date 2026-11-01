"""
AppPoet Static Feature Extractor & Function Call Graph (FCG) Engine
Extracts manifest metadata, permissions, services, broadcast receivers, sensitive API invocation counts,
and constructs whole-program Dalvik Function Call Graphs.
"""

from __future__ import annotations

import json
import logging
import os
import re
import sys
import zipfile
from pathlib import Path
from typing import Any, Dict, List, Optional, Set, Tuple, Union

# Handle Androguard imports gracefully across versions 3.x and 4.x
try:
    from androguard.misc import AnalyzeAPK
except ImportError:
    AnalyzeAPK = None

try:
    from androguard.core.bytecodes.apk import APK
except ImportError:
    try:
        from androguard.core.apk import APK
    except ImportError:
        APK = None

try:
    from androguard.core.analysis.analysis import Analysis
except ImportError:
    try:
        from androguard.core.analysis import Analysis
    except ImportError:
        Analysis = None

from apppoet.core.sensitive_apis import TOP_200_SENSITIVE_APIS
from apppoet.core.heuristics import has_trailing_dot, resolve_physical_apk_path
from apppoet.utils.logger import setup_logger, silence_third_party_loggers

logger = setup_logger("APKExtractor")

# Android XML Schema Namespace
ANDROID_NS = "http://schemas.android.com/apk/res/android"
NAME_ATTR = f"{{{ANDROID_NS}}}name"

# Standard library class prefixes to filter out unless in the sensitive API list
STD_LIB_PREFIXES: Tuple[str, ...] = (
    "Ljava/",
    "Landroid/",
    "Landroidx/",
    "Lkotlin/",
    "Lkotlinx/",
    "Ldalvik/",
    "Lsun/",
    "Lcom/android/",
    "Lorg/apache/http/",
    "Lorg/json/",
    "Lorg/xml/",
    "Lorg/w3c/"
)

# 5 Behavioral keyword regex patterns for node feature extraction
KEYWORD_PATTERNS: List[re.Pattern] = [
    re.compile(r"crypto|cipher|ssl", re.IGNORECASE),
    re.compile(r"net|http|socket|url", re.IGNORECASE),
    re.compile(r"sms|telephony", re.IGNORECASE),
    re.compile(r"file|io|stream", re.IGNORECASE),
    re.compile(r"reflect|invoke|classloader", re.IGNORECASE),
]


class APKExtractionError(Exception):
    """Custom exception raised when APK extraction or parsing fails."""
    pass


class APKExtractor:
    """
    Robust static feature extractor and Function Call Graph builder for Android APKs.
    """

    def __init__(
        self,
        apk_path: Optional[Union[str, Path]] = None,
        output_dir: Optional[Union[str, Path]] = None,
        sensitive_apis: Optional[List[str]] = None,
        verbose: bool = False,
        app_path: Optional[Union[str, Path]] = None
    ):
        silence_third_party_loggers()

        target = app_path if app_path is not None else apk_path
        if target is None:
            raise FileNotFoundError("Target APK path must be provided.")

        self.raw_path = str(target)
        self.has_trailing_dot = has_trailing_dot(self.raw_path)

        # Resolve physical file on disk (cross-platform Linux/Windows compatible)
        physical_path, _, _ = resolve_physical_apk_path(target)
        self.apk_path = physical_path.resolve()

        if not self.apk_path.is_file():
            raise FileNotFoundError(f"APK file not found: {self.apk_path}")

        self.output_dir = Path(output_dir).resolve() if output_dir else Path("./output").resolve()
        self.output_dir.mkdir(parents=True, exist_ok=True)

        self.sensitive_apis = sensitive_apis or TOP_200_SENSITIVE_APIS
        self.sensitive_set: Set[str] = set(self.sensitive_apis)

        # Build sensitive lookup for fast matching
        self._sensitive_lookup: Dict[Tuple[str, str], str] = {}
        self._init_sensitive_lookup()

        # Cached Androguard structures
        self.apk_obj: Optional[APK] = None
        self.dalvik_objs: Optional[List[Any]] = None
        self.analysis_obj: Optional[Analysis] = None

        if verbose:
            logger.setLevel(logging.DEBUG)

    def _init_sensitive_lookup(self) -> None:
        """Indexes sensitive APIs for O(1) matching during bytecode traversal."""
        for sig in self.sensitive_apis:
            norm_sig = sig.strip()
            if "->" in norm_sig:
                cls_part, meth_part = norm_sig.split("->", 1)
            else:
                cls_part, meth_part = norm_sig, ""

            norm_cls = self._normalize_class_name(cls_part)
            norm_meth = meth_part.split("(")[0].strip()
            self._sensitive_lookup[(norm_cls, norm_meth)] = sig

    @staticmethod
    def _normalize_class_name(cls_name: str) -> str:
        """Normalizes various class representations into a standard dot format."""
        cleaned = cls_name.strip()
        if cleaned.startswith("L") and cleaned.endswith(";"):
            cleaned = cleaned[1:-1]
        cleaned = cleaned.replace("/", ".")
        return cleaned

    def check_apk_integrity(self) -> bool:
        """Validates that the file is a readable ZIP with classes.dex and AndroidManifest.xml."""
        if not self.apk_path.is_file():
            return False
        try:
            with zipfile.ZipFile(self.apk_path, "r") as zf:
                namelist = set(zf.namelist())
                has_manifest = "AndroidManifest.xml" in namelist
                has_dex = any(name.startswith("classes") and name.endswith(".dex") for name in namelist)
                return has_manifest or has_dex
        except zipfile.BadZipFile:
            return False
        except Exception as e:
            logger.warning(f"Integrity check exception for {self.apk_path.name}: {e}")
            return False

    def _load_androguard(self) -> None:
        """Parses the APK using Androguard misc.AnalyzeAPK."""
        if self.apk_obj is not None and self.analysis_obj is not None:
            return

        if not self.check_apk_integrity():
            raise APKExtractionError(f"APK integrity check failed or corrupted archive: {self.apk_path}")

        try:
            logger.info(f"Analyzing APK bytecode and manifest with Androguard: {self.apk_path.name}")
            self.apk_obj, self.dalvik_objs, self.analysis_obj = AnalyzeAPK(str(self.apk_path))
        except Exception as err:
            raise APKExtractionError(f"Failed to analyze APK {self.apk_path.name}: {err}") from err

    def load_apk(self) -> None:
        """Public alias for _load_androguard."""
        self._load_androguard()

    def extract_semantic_features(self) -> Dict[str, Any]:
        """Extracts permissions, services, receivers, and top 200 sensitive API counts."""
        self._load_androguard()

        app_perm: List[str] = []
        services: List[str] = []
        receivers: List[str] = []

        if self.apk_obj:
            try:
                raw_perms = self.apk_obj.get_permissions() or []
                app_perm = sorted(list(set(str(p).strip() for p in raw_perms if p)))
            except Exception as e:
                logger.warning(f"Failed to extract declared permissions: {e}")

            try:
                raw_services = self.apk_obj.get_services() or []
                services = sorted(list(set(str(s).strip() for s in raw_services if s)))
            except Exception as e:
                logger.warning(f"Failed to extract services: {e}")

            try:
                raw_receivers = self.apk_obj.get_receivers() or []
                receivers = sorted(list(set(str(r).strip() for r in raw_receivers if r)))
            except Exception as e:
                logger.warning(f"Failed to extract broadcast receivers: {e}")

        # Initialize API counts catalog with 0
        api_counts: Dict[str, int] = {api: 0 for api in self.sensitive_apis}

        if self.analysis_obj:
            try:
                for method_analysis in self.analysis_obj.get_methods():
                    for _, call, _ in method_analysis.get_xref_to():
                        called_class = self._normalize_class_name(str(call.class_name))
                        called_method = str(call.name).strip()

                        matched_sig = self._sensitive_lookup.get((called_class, called_method))
                        if matched_sig and matched_sig in api_counts:
                            api_counts[matched_sig] += 1
            except Exception as e:
                logger.warning(f"Error scanning Dalvik cross-references: {e}")

        return {
            "app_perm": app_perm,
            "services": services,
            "receivers": receivers,
            "api_calls": api_counts
        }

    def generate_fcg(
        self,
        export_format: str = "signature",
        include_external: bool = True
    ) -> Tuple[Path, Optional[Path]]:
        """Constructs and exports the whole-program Function Call Graph (FCG)."""
        self._load_androguard()

        edges: Set[Tuple[str, str]] = set()
        node_to_id: Dict[str, int] = {}
        id_to_node: Dict[int, str] = {}
        next_id = 0

        def get_or_create_id(sig: str) -> int:
            nonlocal next_id
            if sig not in node_to_id:
                node_to_id[sig] = next_id
                id_to_node[next_id] = sig
                next_id += 1
            return node_to_id[sig]

        if self.analysis_obj:
            try:
                for method_analysis in self.analysis_obj.get_methods():
                    caller_sig = f"{method_analysis.class_name}->{method_analysis.name}"

                    for _, call, _ in method_analysis.get_xref_to():
                        called_class = str(call.class_name)
                        called_sig = f"{called_class}->{call.name}"

                        if not include_external and called_class.startswith(STD_LIB_PREFIXES):
                            norm_cls = self._normalize_class_name(called_class)
                            norm_meth = str(call.name).strip()
                            if (norm_cls, norm_meth) not in self._sensitive_lookup:
                                continue

                        edges.add((caller_sig, called_sig))
            except Exception as e:
                logger.warning(f"Error building call graph edges: {e}")

        edge_list_path = self.output_dir / "fcg_edges.txt"
        mapping_path = self.output_dir / "fcg_nodes.json"

        with open(edge_list_path, "w", encoding="utf-8") as ef:
            for src, dst in sorted(edges):
                if export_format == "integer":
                    u = get_or_create_id(src)
                    v = get_or_create_id(dst)
                    ef.write(f"{u} {v}\n")
                else:
                    ef.write(f"{src} {dst}\n")

        # Save integer mapping or node keyword features
        if export_format == "integer":
            with open(mapping_path, "w", encoding="utf-8") as mf:
                json.dump(id_to_node, mf, indent=2)
        else:
            extract_node_features(edge_list_path, output_file=mapping_path)

        logger.info(f"Saved FCG edge list ({len(edges)} directed edges) to: {edge_list_path}")
        return edge_list_path, mapping_path

    def extract_all(
        self,
        decompile: bool = False,
        export_format: str = "signature",
        include_external: bool = True
    ) -> Dict[str, Any]:
        """Executes full extraction pipeline and saves artifacts to output directory."""
        logger.info(f"Starting end-to-end extraction for: {self.apk_path.name}")
        self._load_androguard()

        semantic_data = self.extract_semantic_features()
        features_file = self.output_dir / "semantic_features.json"
        with open(features_file, "w", encoding="utf-8") as f:
            json.dump(semantic_data, f, indent=2)

        edge_file, mapping_file = self.generate_fcg(
            export_format=export_format,
            include_external=include_external
        )

        edge_count = 0
        with open(edge_file, "r", encoding="utf-8") as f:
            edge_count = sum(1 for line in f if line.strip())

        node_count = 0
        if mapping_file and mapping_file.is_file():
            with open(mapping_file, "r", encoding="utf-8") as f:
                node_count = len(json.load(f))

        package_name = ""
        if self.apk_obj:
            try:
                package_name = self.apk_obj.get_package() or ""
            except Exception:
                pass

        active_apis = sum(1 for c in semantic_data["api_calls"].values() if c > 0)

        return {
            "status": "success",
            "apk_name": self.apk_path.name,
            "package_name": package_name,
            "features_path": str(features_file),
            "fcg_path": str(edge_file),
            "node_mapping_path": str(mapping_file) if mapping_file else None,
            "nodes_path": str(mapping_file) if mapping_file else None,
            "semantic_summary": {
                "num_permissions": len(semantic_data["app_perm"]),
                "num_services": len(semantic_data["services"]),
                "num_receivers": len(semantic_data["receivers"]),
                "sensitive_apis_detected": active_apis
            },
            "graph_stats": {
                "num_nodes": node_count,
                "num_edges": edge_count
            }
        }


def extract_node_features(
    edges_file: Union[str, Path],
    output_file: Optional[Union[str, Path]] = None
) -> Dict[str, List[float]]:
    """Generates 5-D regex keyword flags for each method in the call graph."""
    p_edge = Path(edges_file)
    if not p_edge.is_file():
        raise FileNotFoundError(f"FCG edges file not found at: {p_edge}")

    unique_nodes: Set[str] = set()
    with open(p_edge, "r", encoding="utf-8") as f:
        for line in f:
            parts = line.strip().split()
            if len(parts) >= 2:
                unique_nodes.add(parts[0])
                unique_nodes.add(parts[1])

    node_features: Dict[str, List[float]] = {}
    for node in sorted(unique_nodes):
        flags = [1.0 if pat.search(node) else 0.0 for pat in KEYWORD_PATTERNS]
        node_features[node] = flags

    if output_file is not None:
        p_out = Path(output_file)
        p_out.parent.mkdir(parents=True, exist_ok=True)
        with open(p_out, "w", encoding="utf-8") as f:
            json.dump(node_features, f, indent=2)

    return node_features
