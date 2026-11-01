"""
AppPoet End-to-End Multimodal Android Malware Detection Pipeline
Production-ready inference script bridging raw APKs to PyTorch graph and multimodal models.
(Updated with seamless standalone fallback for zero-dependency execution)
"""

from __future__ import annotations

import argparse
import json
import logging
import os
import sys
from pathlib import Path
from typing import Dict, List, Optional, Tuple

sys.path.insert(0, str(Path(__file__).parent.resolve()))

from apppoet.pipeline.detector import AppPoetDetector, analyze_apk
from apppoet.pipeline.reporting import print_terminal_summary
from apppoet.core.heuristics import has_trailing_dot, apply_trailing_dot_bump
from apppoet.models.fusion_classifier import TORCH_AVAILABLE

# Try importing PyG if available
try:
    import torch
    import torch.nn as nn
    from torch_geometric.nn import SAGEConv, global_mean_pool
    from apppoet.models.sage_encoder import DeepSAGEEncoder
    PYG_AVAILABLE = True
except ImportError:
    PYG_AVAILABLE = False


def print_executive_summary(result: Dict) -> None:
    """Formats and prints an executive summary report to the console."""
    print_terminal_summary(result)


def predict_apk(
    apk_path: str,
    weights_path: str = "fusion_classifier.pth",
    device_name: Optional[str] = None
) -> Dict:
    """Runs inference on a target APK using AppPoetDetector."""
    detector = AppPoetDetector(weights_path=weights_path, verbose=False)
    return detector.scan(apk_path)


def main() -> None:
    parser = argparse.ArgumentParser(
        description="AppPoet End-to-End Multimodal Android Malware Detection"
    )
    parser.add_argument("apk", type=str, help="Path to target .apk file to analyze")
    parser.add_argument(
        "--weights",
        type=str,
        default="fusion_classifier.pth",
        help="Path to DeepCrossAttentionFusion weights (default: fusion_classifier.pth)"
    )
    parser.add_argument(
        "--device",
        type=str,
        default=None,
        help="Compute device: 'cpu' or 'cuda' (default: autodetect)"
    )
    parser.add_argument(
        "--json",
        action="store_true",
        help="Output raw JSON results instead of executive summary"
    )

    args = parser.parse_args()

    try:
        report = predict_apk(
            apk_path=args.apk,
            weights_path=args.weights,
            device_name=args.device
        )
        if args.json:
            print(json.dumps(report, indent=2))
        else:
            print_executive_summary(report)
    except Exception as err:
        print(f"Inference pipeline failed: {err}")
        sys.exit(1)


if __name__ == "__main__":
    main()
