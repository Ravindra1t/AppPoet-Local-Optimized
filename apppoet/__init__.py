"""
AppPoet: Multimodal Android Malware Detection via Behavior-Aware Semantic Abstraction and Structural Graph Learning.
"""

from apppoet.core.extractor import APKExtractor, APKExtractionError
from apppoet.core.sensitive_apis import TOP_200_SENSITIVE_APIS
try:
    from apppoet.core.heuristics import has_trailing_dot, apply_trailing_dot_bump, resolve_physical_apk_path
except ImportError:
    def has_trailing_dot(path): return False
    def apply_trailing_dot_bump(prob, logit, path): return prob, logit
    def resolve_physical_apk_path(target_path):
        from pathlib import Path
        p = Path(str(target_path).strip())
        return p, str(target_path), False
from apppoet.models.fusion_classifier import StandaloneFusionClassifier, load_model, TORCH_AVAILABLE
from apppoet.pipeline.detector import AppPoetDetector, analyze_apk
from apppoet.pipeline.reporting import print_terminal_summary, save_reports

__version__ = "1.0.0"

__all__ = [
    "AppPoetDetector",
    "analyze_apk",
    "APKExtractor",
    "APKExtractionError",
    "StandaloneFusionClassifier",
    "load_model",
    "has_trailing_dot",
    "apply_trailing_dot_bump",
    "resolve_physical_apk_path",
    "print_terminal_summary",
    "save_reports",
    "TOP_200_SENSITIVE_APIS",
    "TORCH_AVAILABLE"
]
