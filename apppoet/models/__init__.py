"""AppPoet Models Package: Fusion Classifier, Graph Encoder, and Feature Synthesis."""

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

from apppoet.models.sage_encoder import DeepSAGEEncoder

__all__ = [
    "build_semantic_feature_1024",
    "build_structural_feature_256",
    "StandaloneFusionClassifier",
    "PyTorchFusionClassifier",
    "DeepSAGEEncoder",
    "load_model",
    "TORCH_AVAILABLE"
]
