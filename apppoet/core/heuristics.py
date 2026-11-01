"""
AppPoet Heuristic Analysis & Evasion Detection Module
Implements hardened trailing-dot evasion detection and adaptive probability adjustment.
"""

from __future__ import annotations

import math
from pathlib import Path
from typing import Optional, Tuple, Union


def has_trailing_dot(path: Union[str, Path, None]) -> bool:
    """
    Robustly checks if an app path or filename ends with a trailing dot ('.').
    Handles:
    - Direct trailing dots: 'sample.apk.', 'app.'
    - Trailing slashes or backslashes: 'sample.apk./', 'sample.apk.\\'
    - Whitespace padded strings: '  sample.apk.  '
    - Path objects: Path('sample.apk.')
    """
    if path is None:
        return False

    raw = str(path).strip()
    if not raw:
        return False

    # Check direct trailing dot
    if raw.endswith('.'):
        return True

    # Strip trailing directory separators and re-check
    stripped_separators = raw.rstrip('/\\')
    if stripped_separators.endswith('.'):
        return True

    return False


def resolve_physical_apk_path(target_path: Union[str, Path]) -> Tuple[Path, str, bool]:
    """
    Resolves the actual physical file path on disk while preserving the original input string
    and tracking whether a trailing dot evasion trick was used.

    Crucial for cross-platform compatibility:
    - On Windows, Path('sample.apk.') can often resolve directly to 'sample.apk'.
    - On Linux/Docker, Path('sample.apk.') will fail if the file is physically named 'sample.apk'.
    This function bridges both environments seamlessly.

    Returns:
        (physical_file_path, original_input_str, dot_detected)
    """
    raw_path_str = str(target_path).strip()
    dot_detected = has_trailing_dot(raw_path_str)
    candidate_path = Path(raw_path_str)

    # 1. Direct match exists
    if candidate_path.exists() and candidate_path.is_file():
        return candidate_path, raw_path_str, dot_detected

    # 2. If dot detected or file not found, try stripped filename (Linux fallback)
    normalized_str = raw_path_str.rstrip('/\\').rstrip('.')
    stripped_path = Path(normalized_str)
    if stripped_path.exists() and stripped_path.is_file():
        return stripped_path, raw_path_str, True

    # 3. Check if appending .apk helps
    if not normalized_str.endswith(".apk"):
        apk_appended = Path(f"{normalized_str}.apk")
        if apk_appended.exists() and apk_appended.is_file():
            return apk_appended, raw_path_str, dot_detected

    raise FileNotFoundError(f"Target APK does not exist at: {target_path}")


def apply_trailing_dot_bump(
    prob: float,
    logit: float,
    path: Union[str, Path, None]
) -> Tuple[float, float]:
    """
    If the app path has a dot at the end, bumps the malicious probability by 0.6,
    strictly capped so it does not cross 0.98.
    Also recomputes the corresponding logit to preserve mathematical consistency.
    """
    if has_trailing_dot(path):
        bumped_prob = min(prob + 0.6, 0.98)
        if bumped_prob < 1.0:
            bumped_logit = math.log(bumped_prob / (1.0 - bumped_prob))
        else:
            bumped_logit = logit
        return bumped_prob, bumped_logit
    return prob, logit
