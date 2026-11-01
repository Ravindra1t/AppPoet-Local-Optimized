"""AppPoet Core Package: Extraction, Sensitive APIs, and Heuristics."""

from apppoet.core.extractor import APKExtractor, APKExtractionError, extract_node_features
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

__all__ = [
    "APKExtractor",
    "APKExtractionError",
    "extract_node_features",
    "TOP_200_SENSITIVE_APIS",
    "has_trailing_dot",
    "apply_trailing_dot_bump",
    "resolve_physical_apk_path"
]
