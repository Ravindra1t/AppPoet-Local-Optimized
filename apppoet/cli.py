"""
AppPoet Unified Command-Line Interface
"""

from __future__ import annotations

import argparse
import json
import sys
from pathlib import Path
from typing import List

from apppoet.pipeline.detector import AppPoetDetector
from apppoet.pipeline.reporting import print_terminal_summary, save_reports, BOLD, CYAN, GREEN, RED, RESET


def main() -> None:
    parser = argparse.ArgumentParser(
        description="AppPoet: Unified Multimodal Android Malware Detection Pipeline"
    )
    parser.add_argument(
        "target",
        nargs="?",
        default=None,
        help="Path to an .apk file or a directory containing .apk files"
    )
    parser.add_argument(
        "--output-dir", "-o",
        type=str,
        default="reports",
        help="Directory to save generated JSON and Markdown reports (default: reports)"
    )
    parser.add_argument(
        "--weights", "-w",
        type=str,
        default="fusion_classifier.pth",
        help="Path to trained model weights (default: fusion_classifier.pth)"
    )
    parser.add_argument(
        "--sage-weights", "-s",
        type=str,
        default="sage_encoder.pth",
        help="Path to DeepSAGE GNN encoder weights (default: sage_encoder.pth)"
    )
    parser.add_argument(
        "--json",
        action="store_true",
        help="Print raw JSON report to stdout instead of executive summary"
    )
    parser.add_argument(
        "--benchmark",
        action="store_true",
        help="Run benchmark analysis on benign and malicious sample APKs in workspace"
    )
    parser.add_argument(
        "--no-save",
        action="store_true",
        help="Do not save reports to disk"
    )
    parser.add_argument(
        "--verbose", "-v",
        action="store_true",
        help="Enable verbose debug logging"
    )

    args = parser.parse_args()

    targets: List[str] = []

    if args.benchmark:
        candidates = [
            "ApiDemos-debug.apk",
            "05e70b283808aca9c32cd393c0979f53a3ad2a980b81a467e3cac0e9288c3334.apk"
        ]
        targets = [c for c in candidates if Path(c).exists()]
        if not targets:
            print(f"{RED}Error: No benchmark APKs found in the current directory.{RESET}")
            sys.exit(1)
    elif args.target:
        raw_target = args.target
        p = Path(raw_target)
        if p.is_dir():
            targets = [str(x) for x in p.glob("*.apk")]
            if not targets:
                print(f"{RED}Error: No .apk files found in directory: {p}{RESET}")
                sys.exit(1)
        else:
            targets = [raw_target]
    else:
        parser.print_help()
        print("\nTip: Run 'python run_pipeline.py ApiDemos-debug.apk' or 'python run_pipeline.py --benchmark'")
        sys.exit(0)

    detector = AppPoetDetector(
        weights_path=args.weights,
        sage_weights_path=args.sage_weights,
        verbose=args.verbose
    )

    for target_apk in targets:
        try:
            if not args.json:
                print(f"\n{BOLD}{CYAN}------------------------------------------------------------------------{RESET}")
                print(f"{BOLD}  Scanning APK:{RESET} {target_apk}")
                print(f"{BOLD}{CYAN}------------------------------------------------------------------------{RESET}")

            report = detector.scan(target_apk)

            if not args.no_save:
                json_file, md_file = save_reports(report, output_dir=args.output_dir)

            if args.json:
                print(json.dumps(report, indent=2))
            else:
                print_terminal_summary(report)
                if not args.no_save:
                    print(f"  {GREEN}[+] Reports saved:{RESET}")
                    print(f"      - JSON:     {json_file}")
                    print(f"      - Markdown: {md_file}\n")
        except Exception as e:
            print(f"{RED}Error scanning {target_apk}: {e}{RESET}")


if __name__ == "__main__":
    main()
