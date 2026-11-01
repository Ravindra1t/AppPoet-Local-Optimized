"""
Curated Catalog of Top 200 Sensitive Android APIs (Backward-Compatible Facade)
Re-exports from apppoet.core.sensitive_apis
"""

import sys
from pathlib import Path
sys.path.insert(0, str(Path(__file__).parent.resolve()))

from apppoet.core.sensitive_apis import TOP_200_SENSITIVE_APIS

__all__ = ["TOP_200_SENSITIVE_APIS"]
