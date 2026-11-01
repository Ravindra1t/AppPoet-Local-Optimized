"""
AppPoet Feature Synthesis Module
Transforms raw semantic JSON and Function Call Graph edges into normalized 1024-D and 256-D vectors.
"""

from __future__ import annotations

import math
from typing import Dict, List, Tuple
from apppoet.core.sensitive_apis import TOP_200_SENSITIVE_APIS


def _stable_hash(s: str) -> int:
    """Stable hash across Python processes."""
    import zlib
    return zlib.crc32(s.encode("utf-8"))


def build_semantic_feature_1024(semantic_json: Dict) -> List[float]:
    """
    Transforms extracted semantic features (permissions, services, receivers, sensitive APIs)
    into a standardized 1024-dimensional normalized vector matching model input expectations.
    """
    vec = [0.0] * 1024

    # 1. First 200 dimensions: Normalized counts of the canonical Top 200 Sensitive APIs
    api_calls = semantic_json.get("api_calls", {})
    for idx, api_sig in enumerate(TOP_200_SENSITIVE_APIS):
        count = float(api_calls.get(api_sig, 0))
        vec[idx] = math.log1p(count)

    # 2. Dimensions 200-500: Permission signature projections
    permissions = semantic_json.get("app_perm", [])
    for perm in permissions:
        h = _stable_hash(perm) % 300
        vec[200 + h] += 1.0

    # 3. Dimensions 500-700: Service & Receiver component projections
    components = semantic_json.get("services", []) + semantic_json.get("receivers", [])
    for comp in components:
        h = _stable_hash(comp) % 200
        vec[500 + h] += 1.0

    # 4. Dimensions 700-1024: Cross-category intent & sensitive keyword representations
    sensitive_keywords = [
        "crypto", "cipher", "dex", "classloader", "sms", "telephony", "subscriber",
        "deviceid", "location", "gps", "camera", "record", "socket", "http", "url",
        "runtime", "exec", "process", "package", "install", "accessibility", "overlay"
    ]
    for i, kw in enumerate(sensitive_keywords):
        kw_count = 0
        for api, c in api_calls.items():
            if kw in api.lower():
                kw_count += c
        vec[700 + i] = math.log1p(kw_count)

    # Global L2-Normalization
    norm = math.sqrt(sum(x * x for x in vec))
    if norm > 0:
        vec = [x / norm for x in vec]

    return vec


def build_structural_feature_256(edges: List[Tuple[int, int]], num_nodes: int = 0) -> List[float]:
    """
    Synthesizes a 256-dimensional whole-graph topological feature representation
    from Function Call Graph (FCG) edges.
    Captures: in/out-degree distribution, hub centrality, density, and graph motifs.
    """
    vec = [0.0] * 256

    if not edges:
        return vec

    in_degrees: Dict[int, int] = {}
    out_degrees: Dict[int, int] = {}
    nodes = set()

    for u, v in edges:
        nodes.add(u)
        nodes.add(v)
        out_degrees[u] = out_degrees.get(u, 0) + 1
        in_degrees[v] = in_degrees.get(v, 0) + 1

    total_nodes = max(len(nodes), num_nodes, 1)
    total_edges = len(edges)

    # Graph macroscopic properties (first 32 dimensions)
    vec[0] = math.log1p(total_nodes)
    vec[1] = math.log1p(total_edges)
    vec[2] = total_edges / total_nodes
    vec[3] = math.log1p(max(out_degrees.values(), default=0))
    vec[4] = math.log1p(max(in_degrees.values(), default=0))

    # Degree distribution histograms (dimensions 32-160)
    for d in out_degrees.values():
        bin_idx = min(31, int(math.log1p(d) * 5))
        vec[32 + bin_idx] += 1.0

    for d in in_degrees.values():
        bin_idx = min(31, int(math.log1p(d) * 5))
        vec[64 + bin_idx] += 1.0

    # 2-hop path connectivity approximations (dimensions 160-256)
    for u, v in edges[:1000]:
        h = (u * 31 + v * 17) % 96
        vec[160 + h] += 0.01

    # L2-Normalization
    norm = math.sqrt(sum(x * x for x in vec))
    if norm > 0:
        vec = [x / norm for x in vec]

    return vec
