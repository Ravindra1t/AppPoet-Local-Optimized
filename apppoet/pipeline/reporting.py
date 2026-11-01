"""
AppPoet Reporting Module
Generates polished terminal summaries, structured JSON reports, and Markdown reports.
"""

from __future__ import annotations

import json
from pathlib import Path
from typing import Any, Dict, Tuple, Union

# Terminal Colors
GREEN = "\033[92m"
RED = "\033[91m"
YELLOW = "\033[93m"
CYAN = "\033[96m"
BOLD = "\033[1m"
DIM = "\033[2m"
RESET = "\033[0m"


def print_terminal_summary(report: Dict[str, Any]) -> None:
    """Prints a clear, beautifully aligned executive summary to stdout."""
    verdict = report["prediction"]
    prob = report["malware_probability"]
    confidence = report["confidence_score"]
    stats = report["feature_stats"]

    verdict_badge = f"{RED}{BOLD}[ MALICIOUS ]{RESET}" if verdict == "Malicious" else f"{GREEN}{BOLD}[ BENIGN ]{RESET}"
    prob_str = f"{RED if prob >= 0.5 else GREEN}{prob * 100:.2f}%{RESET} ({prob:.4f})"
    conf_str = f"{BOLD}{confidence * 100:.2f}%{RESET} ({confidence:.4f})"

    print(f"\n{BOLD}========================================================================{RESET}")
    print(f"        {BOLD}AppPoet Multimodal Detection: Executive Summary{RESET}")
    print(f"{BOLD}========================================================================{RESET}")
    print(f"Target APK:                 {BOLD}{report['apk_name']}{RESET}")
    print(f"Package Name:               {report['package_name']}")
    print(f"Analysis Duration:          {report['analysis_time_seconds']}s")
    print("------------------------------------------------------------------------")
    print(f"Final Binary Verdict:       {verdict_badge}")
    print(f"Malware Probability Score:  {prob_str}")
    print(f"Model Confidence:           {conf_str}")
    print("------------------------------------------------------------------------")
    print(f"{BOLD}Multimodal Behavioral Profile:{RESET}")
    print(f"  * Recovered Permissions:  {stats['num_permissions']} (Dangerous: {stats.get('num_dangerous_permissions', 0)})")
    comps_str = f"{stats.get('num_activities', 0)} Activities, {stats['num_services']} Services, {stats['num_receivers']} Receivers, {stats.get('num_providers', 0)} Providers"
    print(f"  * App Components:         {comps_str}")
    print(f"  * Intent Action Triggers: {stats.get('num_intent_actions', 0)} (High-Risk: {stats.get('num_high_risk_intents', 0)})")
    if stats.get("manifest_tampered"):
        print(f"  * Manifest Integrity:     {RED}Tampered / Obfuscated AXML Detected{RESET}")
    else:
        print(f"  * Manifest Integrity:     Clean")
    if stats.get("has_dynamic_code_loading"):
        print(f"  * Dynamic Code Loading:   {RED}Detected (DexClassLoader / InMemoryDexClassLoader){RESET}")
    if stats.get("num_payload_files", 0) > 0:
        print(f"  * Dropper Hidden Assets:  {YELLOW}{stats['num_payload_files']} payload files ({', '.join(stats.get('payload_files', [])[:3])}){RESET}")
    if stats.get("num_native_libraries", 0) > 0:
        abis = f" [{', '.join(stats.get('native_abis', []))}]" if stats.get("native_abis") else ""
        print(f"  * Native Binaries (.so):  {stats['num_native_libraries']}{abis}")
    print(f"  * Sensitive APIs Active:  {stats['unique_sensitive_apis_invoked']} (Total Inbound Calls: {stats['total_sensitive_api_inbound_calls']})")
    print(f"  * Call Graph Topology:    {stats['fcg_nodes']} nodes, {stats['fcg_edges']} edges")

    top_apis = report.get("top_flagged_sensitive_apis", [])
    if top_apis:
        print(f"\n{BOLD}Top Sensitive APIs Invoked:{RESET}")
        for item in top_apis[:5]:
            api_name = item["api"].split("->")[-1] if "->" in item["api"] else item["api"]
            print(f"  - {api_name:<36} (Calls: {item['invocation_count']})")
    print(f"{BOLD}========================================================================{RESET}\n")


def save_reports(
    report: Dict[str, Any],
    output_dir: Union[str, Path] = "reports"
) -> Tuple[Path, Path]:
    """
    Saves clean, structured JSON and Markdown reports to the target directory.
    """
    out_path = Path(output_dir)
    out_path.mkdir(parents=True, exist_ok=True)

    base_stem = Path(report["apk_name"]).stem
    json_path = out_path / f"{base_stem}_report.json"
    md_path = out_path / f"{base_stem}_report.md"

    # 1. JSON Report
    with open(json_path, "w", encoding="utf-8") as f:
        json.dump(report, f, indent=2)

    # 2. Markdown Report
    verdict = report["prediction"]
    stats = report["feature_stats"]

    md_lines = [
        f"# AppPoet Malware Detection Report",
        f"",
        f"**Target Application:** `{report['apk_name']}`  ",
        f"**Package Name:** `{report['package_name']}`  ",
        f"**Analysis Time:** `{report['analysis_time_seconds']} seconds`  ",
        f"",
        f"## Verdict & Classification Summary",
        f"",
        f"- **Verdict:** **`{verdict.upper()}`**",
        f"- **Malware Probability:** **{report['malware_probability'] * 100:.2f}%** (`{report['malware_probability']}`)",
        f"- **Model Confidence:** **{report['confidence_score'] * 100:.2f}%** (`{report['confidence_score']}`)",
        f"- **Logit Score:** `{report['logit']}`",
        f"",
        f"> **Key Difference Note:**",
        f"> - **Malware Probability** estimates the likelihood that the app contains malicious behaviors.",
        f"> - **Model Confidence** measures the model's certainty/conviction in its verdict relative to the 0.5 decision boundary.",
        f"",
        f"## Behavioral & Multimodal Profile",
        f"",
        f"| Feature Category | Count / Value |",
        f"| :--- | :--- |",
        f"| **Recovered Permissions** | {stats['num_permissions']} (Dangerous: {stats.get('num_dangerous_permissions', 0)}) |",
        f"| **Activities** | {stats.get('num_activities', 0)} |",
        f"| **Background Services** | {stats['num_services']} |",
        f"| **Broadcast Receivers** | {stats['num_receivers']} |",
        f"| **Content Providers** | {stats.get('num_providers', 0)} |",
        f"| **Intent Actions** | {stats.get('num_intent_actions', 0)} (High-Risk: {stats.get('num_high_risk_intents', 0)}) |",
        f"| **Manifest Integrity** | {'Tampered / Obfuscated AXML' if stats.get('manifest_tampered') else 'Clean'} |",
        f"| **Dynamic Code Loading** | {'Detected (DexClassLoader/InMemory)' if stats.get('has_dynamic_code_loading') else 'None'} |",
        f"| **Dropper Hidden Assets** | {stats.get('num_payload_files', 0)} files |",
        f"| **Native Libraries (.so)** | {stats.get('num_native_libraries', 0)} |",
        f"| **Active Sensitive APIs** | {stats['unique_sensitive_apis_invoked']} |",
        f"| **Total Sensitive Inbound Calls** | {stats['total_sensitive_api_inbound_calls']} |",
        f"| **FCG Execution Graph Nodes** | {stats['fcg_nodes']} |",
        f"| **FCG Call Graph Edges** | {stats['fcg_edges']} |",
        f"",
        f"## Top Flagged Sensitive APIs",
        f"",
        f"| Method Signature | Invocation Count |",
        f"| :--- | :--- |"
    ]

    for item in report.get("top_flagged_sensitive_apis", []):
        md_lines.append(f"| `{item['api']}` | {item['invocation_count']} |")

    md_lines.extend([
        f"",
        f"---",
        f"*Generated automatically by AppPoet Multimodal Detection Pipeline.*"
    ])

    with open(md_path, "w", encoding="utf-8") as f:
        f.write("\n".join(md_lines))

    return json_path, md_path
