"""
APKExtractor: Robust Android Static Analysis & Function Call Graph (FCG) Pipeline.
(Backward-Compatible Facade delegating to apppoet.core.extractor)
"""

import sys
import argparse
import json
import logging
from pathlib import Path

sys.path.insert(0, str(Path(__file__).parent.resolve()))

from apppoet.core.extractor import (
    APKExtractor,
    APKExtractionError,
    extract_node_features,
    KEYWORD_PATTERNS,
    logger
)
from apppoet.core.sensitive_apis import TOP_200_SENSITIVE_APIS


def main() -> None:
    parser = argparse.ArgumentParser(
        description="Robust Static Analysis & FCG Extraction Engine for Android APKs"
    )
    parser.add_argument("apk", type=str, help="Path to target .apk file to analyze")
    parser.add_argument(
        "-o", "--output",
        type=str,
        default="./output",
        help="Destination directory for extracted artifacts (default: ./output)"
    )
    parser.add_argument(
        "--format",
        choices=["signature", "integer"],
        default="signature",
        help="FCG node format: 'signature' (raw smali methods) or 'integer' (numeric IDs)"
    )
    parser.add_argument(
        "--verbose",
        action="store_true",
        help="Enable detailed debug logging"
    )

    args = parser.parse_args()

    try:
        extractor = APKExtractor(
            apk_path=args.apk,
            output_dir=args.output,
            verbose=args.verbose
        )
        result = extractor.extract_all(
            export_format=args.format
        )
        print(json.dumps(result, indent=2))
    except Exception as err:
        logger.error(f"Extraction failed: {err}", exc_info=True)
        sys.exit(1)


if __name__ == "__main__":
    main()
