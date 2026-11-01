"""
Comprehensive Unit Tests for Trailing Dot Evasion Heuristic Feature.
Validates detection across path formats, probability bumping logic, mathematical consistency,
and full end-to-end pipeline enforcement.
"""

from __future__ import annotations

import math
from pathlib import Path
import unittest

from apppoet.core.heuristics import has_trailing_dot, apply_trailing_dot_bump, resolve_physical_apk_path
from apppoet.models.fusion_classifier import StandaloneFusionClassifier, TORCH_AVAILABLE
from apppoet.pipeline.detector import AppPoetDetector

if TORCH_AVAILABLE:
    from apppoet.models.fusion_classifier import PyTorchFusionClassifier


class TestTrailingDotHardened(unittest.TestCase):

    def test_has_trailing_dot_formats(self):
        """Verifies robust detection across various string, path, and slash formats."""
        # Positive cases
        self.assertTrue(has_trailing_dot("sample.apk."))
        self.assertTrue(has_trailing_dot("path/to/app."))
        self.assertTrue(has_trailing_dot("C:\\Users\\app.apk."))
        self.assertTrue(has_trailing_dot("app.apk./"))
        self.assertTrue(has_trailing_dot("app.apk.\\"))
        self.assertTrue(has_trailing_dot(Path("sample.apk.")))
        self.assertTrue(has_trailing_dot("  app.apk.  "))
        self.assertTrue(has_trailing_dot("app.apk./  "))
        self.assertTrue(has_trailing_dot("malware.dex."))
        self.assertTrue(has_trailing_dot("/data/local/tmp/dropper."))

        # Negative cases
        self.assertFalse(has_trailing_dot("sample.apk"))
        self.assertFalse(has_trailing_dot("path/to/app"))
        self.assertFalse(has_trailing_dot("C:\\Users\\app.apk"))
        self.assertFalse(has_trailing_dot(Path("sample.apk")))
        self.assertFalse(has_trailing_dot(None))
        self.assertFalse(has_trailing_dot(""))
        self.assertFalse(has_trailing_dot("   "))
        self.assertFalse(has_trailing_dot("app.apk.bak"))

    def test_apply_trailing_dot_bump_math(self):
        """Verifies probability is bumped by 0.6, capped strictly at 0.98, and logit updated."""
        # 1. Normal bump: 0.10 + 0.60 = 0.70
        prob, logit = apply_trailing_dot_bump(0.10, -2.1972, "sample.apk.")
        self.assertAlmostEqual(prob, 0.70, places=4)
        expected_logit = math.log(0.70 / 0.30)
        self.assertAlmostEqual(logit, expected_logit, places=4)

        # 2. Border threshold: 0.38 + 0.60 = 0.98
        prob, logit = apply_trailing_dot_bump(0.38, -0.4895, "sample.apk.")
        self.assertAlmostEqual(prob, 0.98, places=4)
        expected_logit = math.log(0.98 / 0.02)
        self.assertAlmostEqual(logit, expected_logit, places=4)

        # 3. Exceeding 0.98: 0.50 + 0.60 = 1.10 -> strictly capped at 0.98
        prob, logit = apply_trailing_dot_bump(0.50, 0.0, "sample.apk.")
        self.assertAlmostEqual(prob, 0.98, places=4)
        self.assertLessEqual(prob, 0.98)

        # 4. Already high: 0.95 + 0.60 = 1.55 -> capped at 0.98
        prob, logit = apply_trailing_dot_bump(0.95, 2.944, "sample.apk.")
        self.assertAlmostEqual(prob, 0.98, places=4)
        self.assertLessEqual(prob, 0.98)

        # 5. Untouched without trailing dot
        prob, logit = apply_trailing_dot_bump(0.15, -1.7346, "sample.apk")
        self.assertEqual(prob, 0.15)
        self.assertEqual(logit, -1.7346)

    def test_resolve_physical_apk_path(self):
        """Tests cross-platform file resolution with and without trailing dot."""
        target = "bitbar-sample-app.apk"
        if not Path(target).exists():
            self.skipTest(f"Test sample {target} not found")

        # 1. Normal path
        phys, raw, dot = resolve_physical_apk_path(target)
        self.assertTrue(phys.exists())
        self.assertEqual(raw, target)
        self.assertFalse(dot)

        # 2. Path with trailing dot
        target_dot = f"{target}."
        phys2, raw2, dot2 = resolve_physical_apk_path(target_dot)
        self.assertTrue(phys2.exists())
        self.assertEqual(raw2, target_dot)
        self.assertTrue(dot2)

    def test_standalone_classifier_predict_bump(self):
        """Verifies StandaloneFusionClassifier.predict bumps probability when app_path has a dot."""
        model = StandaloneFusionClassifier()
        dummy_struct = [0.0] * 256
        dummy_sem = [0.0] * 1024

        base_res = model.predict(dummy_struct, dummy_sem, app_path="test.apk")
        dot_res = model.predict(dummy_struct, dummy_sem, app_path="test.apk.")

        base_prob = base_res["malware_probability"]
        dot_prob = dot_res["malware_probability"]

        expected_bumped = min(round(base_prob + 0.6, 4), 0.98)
        self.assertAlmostEqual(dot_prob, expected_bumped, places=4)
        self.assertLessEqual(dot_prob, 0.98)

        # Verify verdict flips if probability crossed 0.5
        if base_prob < 0.5 and expected_bumped >= 0.5:
            self.assertEqual(base_res["prediction"], "Benign")
            self.assertEqual(dot_res["prediction"], "Malicious")

    def test_pipeline_trailing_dot_bump(self):
        """Verifies the complete detection pipeline triggers the trailing dot heuristic."""
        target = "bitbar-sample-app.apk"
        if not Path(target).exists():
            self.skipTest(f"Test sample {target} not found")

        detector = AppPoetDetector(verbose=False)

        res_normal = detector.scan(target)
        res_dot = detector.scan(f"{target}.")

        prob_normal = res_normal["malware_probability"]
        prob_dot = res_dot["malware_probability"]

        self.assertFalse(res_normal["trailing_dot_heuristic"])
        self.assertTrue(res_dot["trailing_dot_heuristic"])

        expected_bump = min(round(prob_normal + 0.6, 4), 0.98)
        self.assertAlmostEqual(prob_dot, expected_bump, places=4)
        self.assertLessEqual(prob_dot, 0.98)


if __name__ == "__main__":
    unittest.main()
