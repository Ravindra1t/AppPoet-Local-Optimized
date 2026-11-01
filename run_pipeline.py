#!/usr/bin/env python
"""
AppPoet Unified Pipeline Runner (Root CLI Shortcut)
Delegates directly to apppoet.cli.main()
"""

import sys
from pathlib import Path

# Ensure project root is in python path
sys.path.insert(0, str(Path(__file__).parent.resolve()))

from apppoet.cli import main

if __name__ == "__main__":
    main()
