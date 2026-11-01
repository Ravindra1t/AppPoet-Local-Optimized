"""
Unit and Integration Test Suite for APKExtractor.
Validates normalization, API lookup, corrupted payload handling,
schema compliance (200 sensitive APIs), and FCG edge generation.
"""

import json
import os
from pathlib import Path
import tempfile
import unittest
import zipfile
from unittest.mock import MagicMock, patch

from apk_extractor import APKExtractor, APKExtractionError
from sensitive_apis import TOP_200_SENSITIVE_APIS


class TestAPKExtractor(unittest.TestCase):

    def setUp(self):
        self.temp_dir = tempfile.TemporaryDirectory()
        self.output_dir = Path(self.temp_dir.name)

        # Create a mock valid zip/apk file
        self.mock_apk = self.output_dir / "sample.apk"
        with zipfile.ZipFile(self.mock_apk, "w") as z:
            z.writestr("AndroidManifest.xml", b"<manifest></manifest>")
            z.writestr("classes.dex", b"DEX_BYTECODE_CONTENT")

    def tearDown(self):
        self.temp_dir.cleanup()

    def test_file_not_found(self):
        """Verifies FileNotFoundError when initialized with non-existent path."""
        non_existent = self.output_dir / "missing.apk"
        with self.assertRaises(FileNotFoundError):
            APKExtractor(apk_path=non_existent, output_dir=self.output_dir)

    def test_class_name_normalization(self):
        """Verifies proper normalization of Dalvik bytecode class names."""
        test_cases = [
            ("Landroid/telephony/SmsManager;", "android.telephony.SmsManager"),
            ("Ljava/net/URL;", "java.net.URL"),
            ("com/example/MyClass", "com.example.MyClass"),
            ("Ldalvik/system/DexClassLoader;", "dalvik.system.DexClassLoader"),
        ]
        for raw, expected in test_cases:
            normalized = APKExtractor._normalize_class_name(raw)
            self.assertEqual(normalized, expected)

    def test_sensitive_apis_catalog_size(self):
        """Verifies the catalog contains exactly 200 sensitive APIs."""
        self.assertEqual(len(TOP_200_SENSITIVE_APIS), 200)

    def test_apk_integrity_check(self):
        """Tests zip integrity and manifest/dex detection."""
        extractor = APKExtractor(apk_path=self.mock_apk, output_dir=self.output_dir)
        self.assertTrue(extractor.check_apk_integrity())

        # Test with corrupted non-zip file
        corrupted = self.output_dir / "corrupted.apk"
        corrupted.write_bytes(b"INVALID_HEADER_DATA_NOT_ZIP")
        extractor_corrupted = APKExtractor(apk_path=corrupted, output_dir=self.output_dir)
        self.assertFalse(extractor_corrupted.check_apk_integrity())

    def test_sensitive_api_lookup_initialization(self):
        """Verifies the internal lookup map maps methods correctly."""
        extractor = APKExtractor(apk_path=self.mock_apk, output_dir=self.output_dir)
        key = ("android.telephony.SmsManager", "sendTextMessage")
        self.assertIn(key, extractor._sensitive_lookup)
        self.assertEqual(
            extractor._sensitive_lookup[key],
            "Landroid/telephony/SmsManager;->sendTextMessage"
        )

    def test_end_to_end_extraction_mocked(self):
        """
        Tests full extraction workflow with mocked Androguard objects:
        - Permissions, services, receivers
        - Sensitive API call counting
        - FCG directed edges and node mapping export
        """
        extractor = APKExtractor(apk_path=self.mock_apk, output_dir=self.output_dir)

        # Mock APK object
        mock_apk_obj = MagicMock()
        mock_apk_obj.get_permissions.return_value = [
            "android.permission.INTERNET",
            "android.permission.SEND_SMS"
        ]
        mock_apk_obj.get_services.return_value = ["com.test.SyncService"]
        mock_apk_obj.get_receivers.return_value = ["com.test.BootReceiver"]
        mock_apk_obj.get_package.return_value = "com.test.malwareapp"

        # Mock Methods & Cross References
        # Method 1: Caller com.test.MainActivity.onCreate
        m1 = MagicMock()
        m1.is_external.return_value = False
        m1.class_name = "Lcom/test/MainActivity;"
        m1.name = "onCreate"
        m1.descriptor = "(Landroid/os/Bundle;)V"

        # Method 2: Callee SmsManager.sendTextMessage (Sensitive API)
        m2_callee = MagicMock()
        m2_callee.class_name = "Landroid/telephony/SmsManager;"
        m2_callee.name = "sendTextMessage"
        m2_callee.descriptor = "(Ljava/lang/String;)V"
        m2_callee.is_external.return_value = True

        # Method 3: Callee URL.openConnection (Sensitive API)
        m3_callee = MagicMock()
        m3_callee.class_name = "Ljava/net/URL;"
        m3_callee.name = "openConnection"
        m3_callee.descriptor = "()Ljava/net/URLConnection;"
        m3_callee.is_external.return_value = True

        # Configure xrefs: m1 calls m2 and m3
        m1.get_xref_to.return_value = [
            (MagicMock(), m2_callee, 12),
            (MagicMock(), m3_callee, 24)
        ]

        # Configure xref_from for sensitive method counting
        m2_callee.get_xref_from.return_value = [(MagicMock(), m1, 12)]
        m3_callee.get_xref_from.return_value = [(MagicMock(), m1, 24)]

        # Mock Analysis object
        mock_dx = MagicMock()
        mock_dx.get_methods.return_value = [m1, m2_callee, m3_callee]

        extractor.apk_obj = mock_apk_obj
        extractor.dalvik_objs = [MagicMock()]
        extractor.analysis_obj = mock_dx

        # Patch _load_androguard to do nothing since we manually set objects
        with patch.object(extractor, "_load_androguard", return_value=None):
            result = extractor.extract_all(decompile=False, export_format="integer")

        # Verify summary results
        self.assertEqual(result["status"], "success")
        self.assertEqual(result["package_name"], "com.test.malwareapp")
        self.assertEqual(result["semantic_summary"]["num_permissions"], 2)
        self.assertEqual(result["semantic_summary"]["num_services"], 1)
        self.assertEqual(result["semantic_summary"]["num_receivers"], 1)
        self.assertEqual(result["semantic_summary"]["sensitive_apis_detected"], 2)

        # Verify semantic JSON on disk
        features_path = Path(result["features_path"])
        self.assertTrue(features_path.exists())
        with open(features_path, "r", encoding="utf-8") as f:
            data = json.load(f)

        self.assertIn("android.permission.INTERNET", data["app_perm"])
        self.assertIn("android.permission.SEND_SMS", data["app_perm"])
        self.assertEqual(data["services"], ["com.test.SyncService"])
        self.assertEqual(data["receivers"], ["com.test.BootReceiver"])
        self.assertEqual(len(data["api_calls"]), 200)
        self.assertEqual(data["api_calls"]["Landroid/telephony/SmsManager;->sendTextMessage"], 1)
        self.assertEqual(data["api_calls"]["Ljava/net/URL;->openConnection"], 1)

        # Verify FCG Edge List on disk
        fcg_path = Path(result["fcg_path"])
        self.assertTrue(fcg_path.exists())
        edges_content = fcg_path.read_text(encoding="utf-8").strip().splitlines()
        self.assertEqual(len(edges_content), 2)  # (m1 -> m2) and (m1 -> m3)

        # Verify each line matches 'u v' format
        for line in edges_content:
            parts = line.split()
            self.assertEqual(len(parts), 2)
            self.assertTrue(parts[0].isdigit())
            self.assertTrue(parts[1].isdigit())

        # Verify Node Mapping
        node_mapping_path = Path(result["node_mapping_path"])
        self.assertTrue(node_mapping_path.exists())
        with open(node_mapping_path, "r", encoding="utf-8") as f:
            nodes = json.load(f)
        self.assertEqual(len(nodes), 3)


if __name__ == "__main__":
    unittest.main()
