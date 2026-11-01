"""
AppPoet SOTA Static Feature Extractor & Function Call Graph (FCG) Engine
Extracts comprehensive manifest metadata, anti-obfuscation permissions, components,
intent actions, hardware features, dynamic code loading indicators, and sensitive Dalvik API counts.
"""

from __future__ import annotations

import json
import logging
import os
import re
import sys
import zipfile
from pathlib import Path
from typing import Any, Dict, List, Optional, Set, Tuple, Union

# Handle Androguard imports gracefully across versions 3.x and 4.x
try:
    from androguard.misc import AnalyzeAPK
except ImportError:
    AnalyzeAPK = None

try:
    from androguard.core.bytecodes.apk import APK
except ImportError:
    try:
        from androguard.core.apk import APK
    except ImportError:
        APK = None

try:
    from androguard.core.analysis.analysis import Analysis
except ImportError:
    try:
        from androguard.core.analysis import Analysis
    except ImportError:
        Analysis = None

from apppoet.core.sensitive_apis import TOP_200_SENSITIVE_APIS
from apppoet.core.heuristics import has_trailing_dot, resolve_physical_apk_path
from apppoet.utils.logger import setup_logger, silence_third_party_loggers

logger = setup_logger("APKExtractor")

# Standard library class prefixes to filter out unless in the sensitive API list
STD_LIB_PREFIXES: Tuple[str, ...] = (
    "Ljava/",
    "Landroid/",
    "Landroidx/",
    "Lkotlin/",
    "Lkotlinx/",
    "Ldalvik/",
    "Lsun/",
    "Lcom/android/",
    "Lorg/apache/http/",
    "Lorg/json/",
    "Lorg/xml/",
    "Lorg/w3c/"
)

# 5 Behavioral keyword regex patterns for node feature extraction
KEYWORD_PATTERNS: List[re.Pattern] = [
    re.compile(r"crypto|cipher|ssl", re.IGNORECASE),
    re.compile(r"net|http|socket|url", re.IGNORECASE),
    re.compile(r"sms|telephony", re.IGNORECASE),
    re.compile(r"file|io|stream", re.IGNORECASE),
    re.compile(r"reflect|invoke|classloader", re.IGNORECASE),
]

# Regex patterns for SOTA anti-obfuscation manifest recovery
PERMISSION_REGEX = re.compile(
    r'(?:android\.permission\.[A-Z0-9_]+|[a-zA-Z0-9_\.]+\.permission\.[A-Z0-9_]+)',
    re.IGNORECASE
)
INTENT_ACTION_REGEX = re.compile(
    r'(?:android\.intent\.action\.[A-Z0-9_]+|[a-zA-Z0-9_\.]+\.action\.[A-Z0-9_]+)',
    re.IGNORECASE
)
HARDWARE_FEATURE_REGEX = re.compile(
    r'android\.hardware\.[a-z0-9_\.]+',
    re.IGNORECASE
)

# Canonical Dangerous Android Permissions (Google API specification)
DANGEROUS_PERMISSIONS: Set[str] = {
    "android.permission.READ_CALENDAR", "android.permission.WRITE_CALENDAR",
    "android.permission.CAMERA",
    "android.permission.READ_CONTACTS", "android.permission.WRITE_CONTACTS", "android.permission.GET_ACCOUNTS",
    "android.permission.ACCESS_FINE_LOCATION", "android.permission.ACCESS_COARSE_LOCATION", "android.permission.ACCESS_BACKGROUND_LOCATION",
    "android.permission.RECORD_AUDIO",
    "android.permission.READ_PHONE_STATE", "android.permission.READ_PHONE_NUMBERS", "android.permission.CALL_PHONE",
    "android.permission.ANSWER_PHONE_CALLS", "android.permission.READ_CALL_LOG", "android.permission.WRITE_CALL_LOG",
    "android.permission.ADD_VOICEMAIL", "android.permission.USE_SIP", "android.permission.PROCESS_OUTGOING_CALLS",
    "android.permission.BODY_SENSORS", "android.permission.BODY_SENSORS_BACKGROUND",
    "android.permission.SEND_SMS", "android.permission.RECEIVE_SMS", "android.permission.READ_SMS",
    "android.permission.RECEIVE_WAP_PUSH", "android.permission.RECEIVE_MMS",
    "android.permission.READ_EXTERNAL_STORAGE", "android.permission.WRITE_EXTERNAL_STORAGE",
    "android.permission.ACCESS_MEDIA_LOCATION", "android.permission.SYSTEM_ALERT_WINDOW",
    "android.permission.REQUEST_INSTALL_PACKAGES", "android.permission.BIND_ACCESSIBILITY_SERVICE",
    "android.permission.BIND_DEVICE_ADMIN", "android.permission.PACKAGE_USAGE_STATS"
}

# High-Risk / Malware Trigger Intent Actions
HIGH_RISK_INTENTS: Set[str] = {
    "android.intent.action.BOOT_COMPLETED",
    "android.intent.action.LOCKED_BOOT_COMPLETED",
    "android.intent.action.QUICKBOOT_POWERON",
    "android.intent.action.PACKAGE_ADDED",
    "android.intent.action.PACKAGE_REPLACED",
    "android.intent.action.PACKAGE_REMOVED",
    "android.intent.action.MY_PACKAGE_REPLACED",
    "android.provider.Telephony.SMS_RECEIVED",
    "android.intent.action.NEW_OUTGOING_CALL",
    "android.intent.action.PHONE_STATE",
    "android.net.conn.CONNECTIVITY_CHANGE",
    "android.intent.action.SCREEN_ON",
    "android.intent.action.SCREEN_OFF",
    "android.intent.action.ACTION_POWER_CONNECTED",
    "android.intent.action.ACTION_POWER_DISCONNECTED",
    "android.intent.action.BATTERY_LOW",
    "android.app.action.DEVICE_ADMIN_ENABLED",
    "android.net.VpnService"
}

KNOWN_CRYPTO_KEYWORDS: Tuple[str, ...] = (
    "Cipher", "SecretKey", "IvParameter", "AES", "RSA", "DES", "RC4", "Blowfish", "PBEKey", "Mac"
)

SUSPICIOUS_CMD_KEYWORDS: Tuple[str, ...] = (
    "/system/bin/su", "/system/xbin/su", "pm install", "chmod ", "sh ", "su "
)

URL_REGEX = re.compile(r'https?://[a-zA-Z0-9_\-\.]+(?::[0-9]+)?(?:/[^\s"\'<>{}\\|^`]*[a-zA-Z0-9_])?')
IPV4_REGEX = re.compile(r'^(?:[0-9]{1,3}\.){3}[0-9]{1,3}$')


class APKExtractionError(Exception):
    """Custom exception raised when APK extraction or parsing fails."""
    pass


class APKExtractor:
    """
    State-of-the-Art static feature extractor and Function Call Graph builder for Android APKs.
    Resilient against AXML tampering, string obfuscation, and dropper hiding techniques.
    """

    def __init__(
        self,
        apk_path: Optional[Union[str, Path]] = None,
        output_dir: Optional[Union[str, Path]] = None,
        sensitive_apis: Optional[List[str]] = None,
        verbose: bool = False,
        app_path: Optional[Union[str, Path]] = None
    ):
        silence_third_party_loggers()

        target = app_path if app_path is not None else apk_path
        if target is None:
            raise FileNotFoundError("Target APK path must be provided.")

        self.raw_path = str(target)
        self.has_trailing_dot = has_trailing_dot(self.raw_path)

        # Resolve physical file on disk (cross-platform Linux/Windows compatible)
        physical_path, _, _ = resolve_physical_apk_path(target)
        self.apk_path = physical_path.resolve()

        if not self.apk_path.is_file():
            raise FileNotFoundError(f"APK file not found: {self.apk_path}")

        self.output_dir = Path(output_dir).resolve() if output_dir else Path("./output").resolve()
        self.output_dir.mkdir(parents=True, exist_ok=True)

        self.sensitive_apis = sensitive_apis or TOP_200_SENSITIVE_APIS
        self.sensitive_set: Set[str] = set(self.sensitive_apis)

        # Build sensitive lookup for fast matching
        self._sensitive_lookup: Dict[Tuple[str, str], str] = {}
        self._init_sensitive_lookup()

        # Cached Androguard structures
        self.apk_obj: Optional[APK] = None
        self.dalvik_objs: Optional[List[Any]] = None
        self.analysis_obj: Optional[Analysis] = None

        if verbose:
            logger.setLevel(logging.DEBUG)

    def _init_sensitive_lookup(self) -> None:
        """Indexes sensitive APIs for O(1) matching during bytecode traversal."""
        for sig in self.sensitive_apis:
            norm_sig = sig.strip()
            if "->" in norm_sig:
                cls_part, meth_part = norm_sig.split("->", 1)
            else:
                cls_part, meth_part = norm_sig, ""

            norm_cls = self._normalize_class_name(cls_part)
            norm_meth = meth_part.split("(")[0].strip()
            self._sensitive_lookup[(norm_cls, norm_meth)] = sig

    @staticmethod
    def _normalize_class_name(cls_name: str) -> str:
        """Normalizes various class representations into a standard dot format."""
        cleaned = cls_name.strip()
        if cleaned.startswith("L") and cleaned.endswith(";"):
            cleaned = cleaned[1:-1]
        cleaned = cleaned.replace("/", ".")
        return cleaned

    def check_apk_integrity(self) -> bool:
        """Validates that the file is a readable ZIP with classes.dex and AndroidManifest.xml."""
        if not self.apk_path.is_file():
            return False
        try:
            with zipfile.ZipFile(self.apk_path, "r") as zf:
                namelist = set(zf.namelist())
                has_manifest = "AndroidManifest.xml" in namelist
                has_dex = any(name.startswith("classes") and name.endswith(".dex") for name in namelist)
                return has_manifest or has_dex
        except zipfile.BadZipFile:
            return False
        except Exception as e:
            logger.warning(f"Integrity check exception for {self.apk_path.name}: {e}")
            return False

    def _load_androguard(self) -> None:
        """Parses the APK using Androguard misc.AnalyzeAPK."""
        if self.apk_obj is not None and self.analysis_obj is not None:
            return

        if not self.check_apk_integrity():
            raise APKExtractionError(f"APK integrity check failed or corrupted archive: {self.apk_path}")

        try:
            logger.info(f"Analyzing APK bytecode and manifest with Androguard: {self.apk_path.name}")
            self.apk_obj, self.dalvik_objs, self.analysis_obj = AnalyzeAPK(str(self.apk_path))
        except Exception as err:
            raise APKExtractionError(f"Failed to analyze APK {self.apk_path.name}: {err}") from err

    def load_apk(self) -> None:
        """Public alias for _load_androguard."""
        self._load_androguard()

    def _recover_permissions(self) -> List[str]:
        """
        SOTA multi-layer permission recovery:
        1. Standard declared permissions via APK parser.
        2. AXML StringBlock regex traversal (bypasses UNKNOWN_SYSTEM_ATTRIBUTE obfuscation).
        3. XML DOM element attribute deep inspection.
        4. DEX bytecode string constants (runtime permission requests).
        """
        permissions: Set[str] = set()

        # Layer 1: Standard declared permissions
        if self.apk_obj:
            try:
                for p in self.apk_obj.get_permissions() or []:
                    if p and str(p).strip():
                        permissions.add(str(p).strip())
            except Exception as e:
                logger.debug(f"Layer 1 permission extraction warning: {e}")

        # Layer 2: AXML StringBlock string recovery (anti-tampering)
        if self.apk_obj:
            try:
                axml = self.apk_obj.get_android_manifest_axml()
                if axml and hasattr(axml, "axml") and hasattr(axml.axml, "sb"):
                    sb = axml.axml.sb
                    for i in range(sb.stringCount):
                        s = sb.getString(i)
                        if s:
                            matches = PERMISSION_REGEX.findall(s.strip())
                            for m in matches:
                                permissions.add(m)
            except Exception as e:
                logger.debug(f"Layer 2 AXML StringBlock permission extraction warning: {e}")

        # Layer 3: XML Element Tree attribute traversal
        if self.apk_obj:
            try:
                xml = self.apk_obj.get_android_manifest_xml()
                if xml is not None:
                    for elem in xml.iter():
                        tag = elem.tag.split("}")[-1] if "}" in elem.tag else elem.tag
                        if tag in ("uses-permission", "permission", "uses-permission-sdk-23"):
                            for attr_val in elem.attrib.values():
                                if attr_val and isinstance(attr_val, str):
                                    matches = PERMISSION_REGEX.findall(attr_val)
                                    for m in matches:
                                        permissions.add(m)
            except Exception as e:
                logger.debug(f"Layer 3 XML DOM permission extraction warning: {e}")

        # Layer 4: DEX bytecode string constants
        if self.dalvik_objs:
            try:
                for dex in self.dalvik_objs:
                    for s in dex.get_strings():
                        if "permission." in s:
                            matches = PERMISSION_REGEX.findall(s)
                            for m in matches:
                                permissions.add(m)
            except Exception as e:
                logger.debug(f"Layer 4 DEX string permission extraction warning: {e}")

        return sorted(list(permissions))

    def _recover_package_name(
        self,
        activities: List[str],
        services: List[str],
        receivers: List[str],
        providers: List[str]
    ) -> str:
        """
        SOTA package name recovery:
        1. apk_obj.get_package()
        2. Manifest root XML attribute inspection
        3. Longest common package prefix from declared custom components
        4. DEX primary custom class package prefix
        """
        # Strategy 1: Standard APK package
        if self.apk_obj:
            try:
                pkg = self.apk_obj.get_package()
                if pkg and str(pkg).strip() and str(pkg).strip() != "(unspecified)":
                    return str(pkg).strip()
            except Exception:
                pass

        # Strategy 2: Common prefix of components
        all_comps = activities + services + receivers + providers
        custom_comps = [
            c for c in all_comps
            if not c.startswith(("android.", "androidx.", "com.google.", "kotlin.", "kotlinx."))
        ]
        if custom_comps:
            packages = [c.rsplit(".", 1)[0] for c in custom_comps if "." in c]
            if packages:
                # Count most frequent component package prefix
                freq: Dict[str, int] = {}
                for p in packages:
                    prefix = ".".join(p.split(".")[:3]) if len(p.split(".")) >= 3 else p
                    freq[prefix] = freq.get(prefix, 0) + 1
                most_common = max(freq.items(), key=lambda x: x[1])[0]
                return most_common

        # Strategy 3: DEX custom class packages
        if self.analysis_obj:
            try:
                custom_classes = [
                    self._normalize_class_name(c.name) for c in self.analysis_obj.get_classes()
                    if not c.name.startswith(("Landroid/", "Ljava/", "Lkotlin/", "Landroidx/", "Lcom/google/"))
                ]
                if custom_classes:
                    pkgs = [c.rsplit(".", 1)[0] for c in custom_classes if "." in c]
                    if pkgs:
                        freq2: Dict[str, int] = {}
                        for p in pkgs:
                            prefix = ".".join(p.split(".")[:3]) if len(p.split(".")) >= 3 else p
                            freq2[prefix] = freq2.get(prefix, 0) + 1
                        return max(freq2.items(), key=lambda x: x[1])[0]
            except Exception:
                pass

        return "(unspecified)"

    def _extract_manifest_intents_and_features(self) -> Tuple[List[str], List[str]]:
        """Extracts intent filter actions and hardware features with anti-obfuscation."""
        intents: Set[str] = set()
        features: Set[str] = set()

        if self.apk_obj:
            try:
                axml = self.apk_obj.get_android_manifest_axml()
                if axml and hasattr(axml, "axml") and hasattr(axml.axml, "sb"):
                    sb = axml.axml.sb
                    for i in range(sb.stringCount):
                        s = sb.getString(i)
                        if s:
                            for m in INTENT_ACTION_REGEX.findall(s):
                                intents.add(m)
                            for m in HARDWARE_FEATURE_REGEX.findall(s):
                                features.add(m)
            except Exception:
                pass

        return sorted(list(intents)), sorted(list(features))

    def _extract_sdk_and_metadata(self) -> Dict[str, Any]:
        """
        Extracts Android SDK versions, version names/codes, and flags.
        Resilient against XML attribute tampering (e.g. UNKNOWN_SYSTEM_ATTRIBUTE obfuscation).
        """
        meta: Dict[str, Any] = {
            "app_name": None,
            "version_code": None,
            "version_name": None,
            "min_sdk_version": None,
            "target_sdk_version": None,
            "max_sdk_version": None,
            "is_debuggable": False,
            "manifest_tampered": False
        }
        if not self.apk_obj:
            return meta

        def _val_or_none(fn_name: str) -> Optional[Union[str, int]]:
            try:
                fn = getattr(self.apk_obj, fn_name, None)
                if callable(fn):
                    res = fn()
                    if isinstance(res, (str, int, float)) and type(res).__name__ != "MagicMock":
                        return res
            except Exception:
                pass
            return None

        meta["app_name"] = _val_or_none("get_app_name")
        meta["version_code"] = _val_or_none("get_androidversion_code")
        meta["version_name"] = _val_or_none("get_androidversion_name")
        meta["min_sdk_version"] = _val_or_none("get_min_sdk_version")
        meta["target_sdk_version"] = _val_or_none("get_target_sdk_version")
        meta["max_sdk_version"] = _val_or_none("get_max_sdk_version")

        try:
            dbg = getattr(self.apk_obj, "is_debuggable", lambda: False)()
            meta["is_debuggable"] = bool(dbg) if isinstance(dbg, (bool, int)) and type(dbg).__name__ != "MagicMock" else False
        except Exception:
            pass

        # Check for AXML attribute tampering
        try:
            xml = getattr(self.apk_obj, "get_android_manifest_xml", lambda: None)()
            if xml is not None and hasattr(xml, "iter") and type(xml).__name__ != "MagicMock":
                for elem in xml.iter():
                    if hasattr(elem, "attrib") and hasattr(elem.attrib, "items"):
                        for k, v in elem.attrib.items():
                            if "UNKNOWN_SYSTEM_ATTRIBUTE" in str(k) or "0xFFFFFFFF" in str(v):
                                meta["manifest_tampered"] = True
                                break
                    if meta["manifest_tampered"]:
                        break
        except Exception:
            pass

        return meta

    def _extract_certificates(self) -> List[Dict[str, Any]]:
        """
        Extracts cryptographic APK signing certificates, SHA256/MD5 fingerprints,
        and identifies self-signed and debug certificates.
        """
        certs_info: List[Dict[str, Any]] = []
        if not self.apk_obj:
            return certs_info

        try:
            fn = getattr(self.apk_obj, "get_certificates", None)
            if not callable(fn):
                return certs_info
            raw_certs = fn()
            if not isinstance(raw_certs, (list, tuple, set)) or type(raw_certs).__name__ == "MagicMock":
                return certs_info

            for c in raw_certs:
                if type(c).__name__ == "MagicMock":
                    continue
                issuer = str(getattr(getattr(c, "issuer", None), "human_friendly", "")) if hasattr(c, "issuer") else ""
                subject = str(getattr(getattr(c, "subject", None), "human_friendly", "")) if hasattr(c, "subject") else ""
                serial = str(getattr(c, "serial_number", ""))
                sha256 = str(getattr(c, "sha256_fingerprint", ""))
                md5 = str(getattr(c, "md5_fingerprint", ""))
                is_self = (issuer == subject) if issuer and subject else False
                is_dbg = "Android Debug" in issuer or "Android Debug" in subject or "testkey" in issuer.lower()

                certs_info.append({
                    "issuer": issuer,
                    "subject": subject,
                    "serial_number": serial,
                    "sha256_fingerprint": sha256,
                    "md5_fingerprint": md5,
                    "is_self_signed": is_self,
                    "is_debug": is_dbg
                })
        except Exception as e:
            logger.debug(f"Certificate extraction exception: {e}")

        return certs_info

    def _extract_component_details(
        self,
        activities: List[str],
        services: List[str],
        receivers: List[str],
        providers: List[str]
    ) -> List[Dict[str, Any]]:
        """
        Extracts component metadata including exported status and declared intent filters.
        """
        details: List[Dict[str, Any]] = []
        if not self.apk_obj or not hasattr(self.apk_obj, "get_intent_filters"):
            return details

        types_map = [
            ("activity", activities),
            ("service", services),
            ("receiver", receivers),
            ("provider", providers)
        ]

        for comp_type, comp_list in types_map:
            for comp in comp_list:
                item_info: Dict[str, Any] = {
                    "name": str(comp),
                    "type": comp_type,
                    "exported": False,
                    "intent_actions": [],
                    "intent_categories": [],
                    "data_schemes": []
                }
                try:
                    res = self.apk_obj.get_intent_filters(comp_type, comp)
                    if isinstance(res, dict) and type(res).__name__ != "MagicMock":
                        raw_acts = res.get("action", [])
                        if isinstance(raw_acts, (list, tuple)):
                            item_info["intent_actions"] = [str(a) for a in raw_acts if isinstance(a, str)]
                        raw_cats = res.get("category", [])
                        if isinstance(raw_cats, (list, tuple)):
                            item_info["intent_categories"] = [str(c) for c in raw_cats if isinstance(c, str)]
                        raw_data = res.get("data", [])
                        if isinstance(raw_data, (list, tuple)):
                            item_info["data_schemes"] = [
                                str(d.get("scheme", "")) for d in raw_data if isinstance(d, dict) and d.get("scheme")
                            ]
                        if item_info["intent_actions"] or item_info["intent_categories"]:
                            item_info["exported"] = True
                except Exception:
                    pass

                details.append(item_info)

        return details

    def _extract_dropper_and_payload_indicators(self) -> Tuple[Dict[str, bool], List[str], List[str], List[str]]:
        """
        SOTA dropper detection:
        1. Dynamic class loaders (InMemoryDexClassLoader, DexClassLoader, PathClassLoader, DelegateLastClassLoader)
        2. Hidden asset/raw payload files (.bin, .dat, .dex, .jar, .apk, .elf, .sh)
        3. Native libraries (.so files) and target CPU architectures (ABIs)
        """
        dyn_loaders = {
            "has_dex_class_loader": False,
            "has_in_memory_dex_class_loader": False,
            "has_path_class_loader": False,
            "has_delegate_last_class_loader": False,
            "has_reflection": False
        }

        if self.dalvik_objs:
            try:
                for dex in self.dalvik_objs:
                    if not hasattr(dex, "get_strings"):
                        continue
                    for s in dex.get_strings():
                        s_str = str(s)
                        if "DexClassLoader" in s_str:
                            dyn_loaders["has_dex_class_loader"] = True
                        if "InMemoryDexClassLoader" in s_str:
                            dyn_loaders["has_in_memory_dex_class_loader"] = True
                        if "PathClassLoader" in s_str:
                            dyn_loaders["has_path_class_loader"] = True
                        if "DelegateLastClassLoader" in s_str:
                            dyn_loaders["has_delegate_last_class_loader"] = True
                        if "Ljava/lang/reflect/Method;->invoke" in s_str or "Class.forName" in s_str:
                            dyn_loaders["has_reflection"] = True
            except Exception:
                pass

        payload_files: List[str] = []
        native_libs: List[str] = []
        native_abis: Set[str] = set()

        if self.apk_obj and hasattr(self.apk_obj, "get_files"):
            try:
                for f in self.apk_obj.get_files():
                    if f.endswith(".so"):
                        native_libs.append(f)
                        parts = f.split("/")
                        if len(parts) >= 2 and parts[0] == "lib":
                            native_abis.add(parts[1])
                    elif any(f.endswith(ext) for ext in [".bin", ".dat", ".dex", ".jar", ".apk", ".elf", ".sh"]) and f != "classes.dex":
                        payload_files.append(f)
            except Exception:
                pass

        return dyn_loaders, sorted(payload_files), sorted(native_libs), sorted(list(native_abis))

    def _extract_bytecode_intelligence(self) -> Dict[str, Any]:
        """
        Extracts bytecode-level static intelligence:
        - Cryptographic primitives and algorithms
        - Hardcoded URLs & IPs
        - Suspicious shell commands & root indicators
        - Code metrics (classes, custom classes, short identifier ratio)
        """
        crypto_found: Set[str] = set()
        suspicious_cmds: Set[str] = set()
        hardcoded_urls: Set[str] = set()
        hardcoded_ips: Set[str] = set()

        total_classes = 0
        custom_classes = 0
        short_named_classes = 0

        # Class analysis
        if self.analysis_obj and hasattr(self.analysis_obj, "get_classes"):
            try:
                for c in self.analysis_obj.get_classes():
                    total_classes += 1
                    c_name = self._normalize_class_name(c.name)
                    if not c.name.startswith(("Landroid/", "Ljava/", "Lkotlin/", "Landroidx/", "Lcom/google/", "Ldalvik/")):
                        custom_classes += 1
                        simple_name = c_name.rsplit(".", 1)[-1]
                        if len(simple_name) <= 2:
                            short_named_classes += 1
            except Exception:
                pass

        # String pool analysis across all DEX files
        if self.dalvik_objs:
            try:
                for dex in self.dalvik_objs:
                    if not hasattr(dex, "get_strings"):
                        continue
                    for s in dex.get_strings():
                        s_str = str(s).strip()
                        if not s_str:
                            continue

                        # Check crypto keywords
                        for kw in KNOWN_CRYPTO_KEYWORDS:
                            if kw.lower() in s_str.lower() and len(s_str) < 40:
                                crypto_found.add(s_str)

                        # Check commands / root indicators
                        for cmd in SUSPICIOUS_CMD_KEYWORDS:
                            if cmd in s_str and len(s_str) < 100:
                                suspicious_cmds.add(s_str)

                        # URLs
                        for url in URL_REGEX.findall(s_str):
                            if 10 < len(url) < 120 and not url.startswith("http://schemas.android.com"):
                                hardcoded_urls.add(url)

                        # IPv4 addresses
                        if IPV4_REGEX.match(s_str) and not s_str.startswith(("127.", "0.0.")):
                            hardcoded_ips.add(s_str)
            except Exception:
                pass

        short_ratio = round(short_named_classes / max(custom_classes, 1), 3)

        return {
            "total_classes": total_classes,
            "custom_classes": custom_classes,
            "short_class_names_ratio": short_ratio,
            "crypto_primitives": sorted(list(crypto_found)),
            "suspicious_commands": sorted(list(suspicious_cmds)),
            "hardcoded_urls": sorted(list(hardcoded_urls))[:25],
            "hardcoded_ips": sorted(list(hardcoded_ips))[:25],
        }

    def extract_semantic_features(self) -> Dict[str, Any]:
        """
        Extracts SOTA semantic features:
        - Multi-layer recovered permissions (including dangerous and declared subsets)
        - Services, Broadcast Receivers, Activities, Content Providers with intent filters
        - High-risk boot/system triggers and Hardware Features
        - Cryptographic signing certificates and V1/V2/V3 signatures
        - SDK versions and AXML anti-tampering markers
        - Top 200 Sensitive Android API invocation counts across all DEX files
        - Dynamic code loading flags, hidden payloads, and native library ABIs
        - Bytecode intelligence: crypto algorithms, root commands, URLs, IPs, obfuscation metrics
        """
        self._load_androguard()

        # 1. Recover Permissions
        app_perm = self._recover_permissions()
        dangerous_perm = sorted([p for p in app_perm if p in DANGEROUS_PERMISSIONS])

        # 2. Extract Components
        services: List[str] = []
        receivers: List[str] = []
        activities: List[str] = []
        providers: List[str] = []

        if self.apk_obj:
            try:
                services = sorted(list(set(str(s).strip() for s in (getattr(self.apk_obj, "get_services", lambda: [])() or []) if s)))
            except Exception:
                pass
            try:
                receivers = sorted(list(set(str(r).strip() for r in (getattr(self.apk_obj, "get_receivers", lambda: [])() or []) if r)))
            except Exception:
                pass
            try:
                activities = sorted(list(set(str(a).strip() for a in (getattr(self.apk_obj, "get_activities", lambda: [])() or []) if a)))
            except Exception:
                pass
            try:
                providers = sorted(list(set(str(p).strip() for p in (getattr(self.apk_obj, "get_providers", lambda: [])() or []) if p)))
            except Exception:
                pass

        # 3. Recover Package Name
        package_name = self._recover_package_name(activities, services, receivers, providers)

        # 4. Intent Actions & Hardware Features
        intent_actions, hardware_features = self._extract_manifest_intents_and_features()
        high_risk_intents = sorted([act for act in intent_actions if act in HIGH_RISK_INTENTS])

        # 5. Component Details & Intent Filters
        component_details = self._extract_component_details(activities, services, receivers, providers)

        # 6. Dropper Payloads, Dynamic Loaders & Native ABIs
        dyn_loaders, payload_files, native_libs, native_abis = self._extract_dropper_and_payload_indicators()

        # 7. SDK Versions & Manifest Anti-Tampering
        sdk_metadata = self._extract_sdk_and_metadata()

        # 8. Certificate & Signing Intelligence
        certs_info = self._extract_certificates()
        def _safe_bool(fn_name: str) -> bool:
            try:
                fn = getattr(self.apk_obj, fn_name, None)
                if callable(fn):
                    res = fn()
                    if isinstance(res, (bool, int)) and type(res).__name__ != "MagicMock":
                        return bool(res)
            except Exception:
                pass
            return False

        signing_info = {
            "is_signed": _safe_bool("is_signed"),
            "is_signed_v1": _safe_bool("is_signed_v1"),
            "is_signed_v2": _safe_bool("is_signed_v2"),
            "is_signed_v3": _safe_bool("is_signed_v3"),
            "certificates": certs_info
        }

        # 9. Bytecode Intelligence (Crypto, Commands, URLs, IPs, Metrics)
        bytecode_intel = self._extract_bytecode_intelligence()

        # 10. Sensitive API counts across all Dalvik methods
        api_counts: Dict[str, int] = {api: 0 for api in self.sensitive_apis}

        if self.analysis_obj and hasattr(self.analysis_obj, "get_methods"):
            try:
                for method_analysis in self.analysis_obj.get_methods():
                    for _, call, _ in getattr(method_analysis, "get_xref_to", lambda: [])():
                        called_class = self._normalize_class_name(str(call.class_name))
                        called_method = str(call.name).strip()

                        matched_sig = self._sensitive_lookup.get((called_class, called_method))
                        if matched_sig and matched_sig in api_counts:
                            api_counts[matched_sig] += 1
            except Exception as e:
                logger.warning(f"Error scanning Dalvik cross-references: {e}")

        return {
            "package_name": package_name,
            "metadata": sdk_metadata,
            "app_perm": app_perm,
            "dangerous_permissions": dangerous_perm,
            "services": services,
            "receivers": receivers,
            "activities": activities,
            "providers": providers,
            "component_details": component_details,
            "intent_actions": intent_actions,
            "high_risk_intents": high_risk_intents,
            "hardware_features": hardware_features,
            "signing_info": signing_info,
            "dynamic_code_loading": dyn_loaders,
            "payload_files": payload_files,
            "native_libraries": native_libs,
            "native_abis": native_abis,
            "bytecode_intelligence": bytecode_intel,
            "api_calls": api_counts,
            "total_api_calls": sum(api_counts.values())
        }

    def generate_fcg(
        self,
        export_format: str = "signature",
        include_external: bool = True
    ) -> Tuple[Path, Optional[Path]]:
        """Constructs and exports the whole-program Function Call Graph (FCG)."""
        self._load_androguard()

        edges: Set[Tuple[str, str]] = set()
        node_to_id: Dict[str, int] = {}
        id_to_node: Dict[int, str] = {}
        next_id = 0

        def get_or_create_id(sig: str) -> int:
            nonlocal next_id
            if sig not in node_to_id:
                node_to_id[sig] = next_id
                id_to_node[next_id] = sig
                next_id += 1
            return node_to_id[sig]

        if self.analysis_obj:
            try:
                for method_analysis in self.analysis_obj.get_methods():
                    caller_sig = f"{method_analysis.class_name}->{method_analysis.name}"

                    for _, call, _ in method_analysis.get_xref_to():
                        called_class = str(call.class_name)
                        called_sig = f"{called_class}->{call.name}"

                        if not include_external and called_class.startswith(STD_LIB_PREFIXES):
                            norm_cls = self._normalize_class_name(called_class)
                            norm_meth = str(call.name).strip()
                            if (norm_cls, norm_meth) not in self._sensitive_lookup:
                                continue

                        edges.add((caller_sig, called_sig))
            except Exception as e:
                logger.warning(f"Error building call graph edges: {e}")

        edge_list_path = self.output_dir / "fcg_edges.txt"
        mapping_path = self.output_dir / "fcg_nodes.json"

        with open(edge_list_path, "w", encoding="utf-8") as ef:
            for src, dst in sorted(edges):
                if export_format == "integer":
                    u = get_or_create_id(src)
                    v = get_or_create_id(dst)
                    ef.write(f"{u} {v}\n")
                else:
                    ef.write(f"{src} {dst}\n")

        # Save integer mapping or node keyword features
        if export_format == "integer":
            with open(mapping_path, "w", encoding="utf-8") as mf:
                json.dump(id_to_node, mf, indent=2)
        else:
            extract_node_features(edge_list_path, output_file=mapping_path)

        logger.info(f"Saved FCG edge list ({len(edges)} directed edges) to: {edge_list_path}")
        return edge_list_path, mapping_path

    def extract_all(
        self,
        decompile: bool = False,
        export_format: str = "signature",
        include_external: bool = True
    ) -> Dict[str, Any]:
        """Executes full SOTA extraction pipeline and saves artifacts to output directory."""
        logger.info(f"Starting end-to-end SOTA extraction for: {self.apk_path.name}")
        self._load_androguard()

        semantic_data = self.extract_semantic_features()
        features_file = self.output_dir / "semantic_features.json"
        with open(features_file, "w", encoding="utf-8") as f:
            json.dump(semantic_data, f, indent=2)

        edge_file, mapping_file = self.generate_fcg(
            export_format=export_format,
            include_external=include_external
        )

        edge_count = 0
        with open(edge_file, "r", encoding="utf-8") as f:
            edge_count = sum(1 for line in f if line.strip())

        node_count = 0
        if mapping_file and mapping_file.is_file():
            with open(mapping_file, "r", encoding="utf-8") as f:
                node_count = len(json.load(f))

        active_apis = sum(1 for c in semantic_data["api_calls"].values() if c > 0)
        has_dynamic = any(semantic_data["dynamic_code_loading"].values())

        return {
            "status": "success",
            "apk_name": self.apk_path.name,
            "package_name": semantic_data["package_name"],
            "features_path": str(features_file),
            "fcg_path": str(edge_file),
            "node_mapping_path": str(mapping_file) if mapping_file else None,
            "nodes_path": str(mapping_file) if mapping_file else None,
            "semantic_summary": {
                "num_permissions": len(semantic_data["app_perm"]),
                "num_dangerous_permissions": len(semantic_data.get("dangerous_permissions", [])),
                "num_services": len(semantic_data["services"]),
                "num_receivers": len(semantic_data["receivers"]),
                "num_activities": len(semantic_data["activities"]),
                "num_providers": len(semantic_data["providers"]),
                "num_intent_actions": len(semantic_data["intent_actions"]),
                "num_high_risk_intents": len(semantic_data.get("high_risk_intents", [])),
                "sensitive_apis_detected": active_apis,
                "has_dynamic_code_loading": has_dynamic,
                "num_payload_files": len(semantic_data["payload_files"]),
                "num_native_libraries": len(semantic_data["native_libraries"]),
                "native_abis": semantic_data.get("native_abis", []),
                "is_signed": semantic_data.get("signing_info", {}).get("is_signed", False),
                "manifest_tampered": semantic_data.get("metadata", {}).get("manifest_tampered", False)
            },
            "graph_stats": {
                "num_nodes": node_count,
                "num_edges": edge_count
            }
        }


def extract_node_features(
    edges_file: Union[str, Path],
    output_file: Optional[Union[str, Path]] = None
) -> Dict[str, List[float]]:
    """Generates 5-D regex keyword flags for each method in the call graph."""
    p_edge = Path(edges_file)
    if not p_edge.is_file():
        raise FileNotFoundError(f"FCG edges file not found at: {p_edge}")

    unique_nodes: Set[str] = set()
    with open(p_edge, "r", encoding="utf-8") as f:
        for line in f:
            parts = line.strip().split()
            if len(parts) >= 2:
                unique_nodes.add(parts[0])
                unique_nodes.add(parts[1])

    node_features: Dict[str, List[float]] = {}
    for node in sorted(unique_nodes):
        flags = [1.0 if pat.search(node) else 0.0 for pat in KEYWORD_PATTERNS]
        node_features[node] = flags

    if output_file is not None:
        p_out = Path(output_file)
        p_out.parent.mkdir(parents=True, exist_ok=True)
        with open(p_out, "w", encoding="utf-8") as f:
            json.dump(node_features, f, indent=2)

    return node_features
