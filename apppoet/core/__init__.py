"""AppPoet Core Package: Extraction, Sensitive APIs, and Heuristics."""

from apppoet.core.extractor import APKExtractor, APKExtractionError, extract_node_features
from apppoet.core.sensitive_apis import TOP_200_SENSITIVE_APIS
from apppoet.core.heuristics import has_trailing_dot, apply_trailing_dot_bump, resolve_physical_apk_path

__all__ = [
    "APKExtractor",
    "APKExtractionError",
    "extract_node_features",
    "TOP_200_SENSITIVE_APIS",
    "has_trailing_dot",
    "apply_trailing_dot_bump",
    "resolve_physical_apk_path"
]
