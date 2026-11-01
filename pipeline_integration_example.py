"""
End-to-End Pipeline Integration:
(Backward-Compatible Facade delegating to apppoet.pipeline.detector)
"""

import sys
import json
from pathlib import Path
from typing import Dict, Optional, Union

sys.path.insert(0, str(Path(__file__).parent.resolve()))

from apppoet.pipeline.detector import AppPoetDetector, load_fcg_edges
from apppoet.core.heuristics import has_trailing_dot, apply_trailing_dot_bump


def run_inference_pipeline(
    apk_path: Optional[Union[str, Path]] = None,
    weights_path: str = "fusion_classifier.pth",
    app_path: Optional[Union[str, Path]] = None
) -> Dict:
    """
    Executes full detection pipeline using AppPoetDetector.
    Maintains exact schema compatibility for existing tests and scripts.
    """
    target = app_path if app_path is not None else apk_path
    if target is None:
        raise ValueError("Target APK or app path must be specified.")

    detector = AppPoetDetector(weights_path=weights_path, verbose=False)
    return detector.scan(target)


def run_benchmark_tests() -> None:
    """Tests the full pipeline on available test APKs in the workspace."""
    print("=" * 70)
    print("AppPoet Multimodal Pipeline - Benchmark Testing")
    print("=" * 70)

    test_candidates = [
        ("ApiDemos-debug.apk", "Benign Reference Sample"),
        ("05e70b283808aca9c32cd393c0979f53a3ad2a980b81a467e3cac0e9288c3334.apk", "User Uploaded Dropper Sample")
    ]

    detector = AppPoetDetector(weights_path="fusion_classifier.pth", verbose=False)

    for apk_name, label in test_candidates:
        if Path(apk_name).exists():
            print(f"\n[+] Scanning {label}: {apk_name}")
            try:
                res = detector.scan(apk_name)
                print(f"    - Package Name:        {res['package_name']}")
                print(f"    - Prediction:          {res['prediction']}")
                print(f"    - Malware Probability: {res['malware_probability'] * 100:.2f}%")
                print(f"    - Model Confidence:    {res['confidence_score'] * 100:.2f}%")
                print(f"    - Permissions:         {res['feature_stats']['num_permissions']}")
                print(f"    - Sensitive APIs:      {res['feature_stats']['unique_sensitive_apis_invoked']}")
                print(f"    - FCG Graph Topology:  {res['feature_stats']['fcg_nodes']} nodes, {res['feature_stats']['fcg_edges']} edges")
                if res['top_flagged_sensitive_apis']:
                    print(f"    - Top Sensitive APIs:  {', '.join([x['api'].split('->')[-1] for x in res['top_flagged_sensitive_apis'][:4]])}")
            except Exception as e:
                print(f"    [!] Error during pipeline run: {e}")
        else:
            print(f"[-] Candidate APK not found: {apk_name}")
    print("\n" + "=" * 70)


if __name__ == "__main__":
    if len(sys.argv) > 1:
        target = sys.argv[1]
        print(f"Executing AppPoet pipeline on: {target}")
        result = run_inference_pipeline(target)
        print(json.dumps(result, indent=2))
    else:
        run_benchmark_tests()
