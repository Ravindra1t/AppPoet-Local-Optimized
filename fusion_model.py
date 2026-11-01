"""
AppPoet Fusion Model & Feature Synthesis (Backward-Compatible Facade)
Re-exports core neural classifiers and feature transformations from the apppoet package.
"""

import sys
from pathlib import Path
sys.path.insert(0, str(Path(__file__).parent.resolve()))

try:
    from apppoet.core.heuristics import has_trailing_dot, apply_trailing_dot_bump
except ImportError:
    def has_trailing_dot(path): return False
    def apply_trailing_dot_bump(prob, logit, path): return prob, logit
from apppoet.models.feature_synthesis import build_semantic_feature_1024, build_structural_feature_256
from apppoet.models.fusion_classifier import (
    StandaloneFusionClassifier,
    load_model,
    TORCH_AVAILABLE
)

if TORCH_AVAILABLE:
    from apppoet.models.fusion_classifier import PyTorchFusionClassifier
else:
    PyTorchFusionClassifier = None

from apppoet.core.sensitive_apis import TOP_200_SENSITIVE_APIS

__all__ = [
    "has_trailing_dot",
    "apply_trailing_dot_bump",
    "build_semantic_feature_1024",
    "build_structural_feature_256",
    "StandaloneFusionClassifier",
    "PyTorchFusionClassifier",
    "load_model",
    "TORCH_AVAILABLE",
    "TOP_200_SENSITIVE_APIS"
]
