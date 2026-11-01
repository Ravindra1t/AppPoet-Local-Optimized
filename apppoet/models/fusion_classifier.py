"""
AppPoet Fusion Classifier Model & Inference Module
Implements the exact neural architecture matching fusion_classifier.pth:
1. align_sem: Linear(1024 -> 256)
2. attn: MultiheadAttention(embed_dim=256, num_heads=4)
3. classifier: MLP(512 -> 512 -> 256 -> 1) with BatchNorm, GELU, and Dropout

Supports both:
- Native PyTorch execution (when PyTorch is installed)
- Pure Python Standalone execution (zero external dependencies, runs anywhere)
"""

from __future__ import annotations

import math
import os
import struct
import zipfile
from pathlib import Path
from typing import Any, Dict, List, Optional, Tuple, Union

try:
    import torch
    import torch.nn as nn
    TORCH_AVAILABLE = True
except ImportError:
    TORCH_AVAILABLE = False

try:
    from apppoet.core.heuristics import has_trailing_dot, apply_trailing_dot_bump
except ImportError:
    def has_trailing_dot(path): return False
    def apply_trailing_dot_bump(prob, logit, path): return prob, logit


if TORCH_AVAILABLE:
    class PyTorchFusionClassifier(nn.Module):
        """
        Multimodal Cross-Attention Fusion Classifier in native PyTorch.
        Matches the exact state_dict keys of fusion_classifier.pth.
        """
        def __init__(self, sem_dim: int = 1024, struct_dim: int = 256, hidden_dim: int = 512, num_heads: int = 4):
            super().__init__()
            self.sem_dim = sem_dim
            self.struct_dim = struct_dim
            self.hidden_dim = hidden_dim

            self.align_sem = nn.Linear(sem_dim, struct_dim)
            self.attn = nn.MultiheadAttention(
                embed_dim=struct_dim,
                num_heads=num_heads,
                batch_first=True
            )
            self.classifier = nn.Sequential(
                nn.Linear(hidden_dim, hidden_dim),    # 0
                nn.BatchNorm1d(hidden_dim),          # 1
                nn.GELU(),                           # 2
                nn.Dropout(p=0.4),                   # 3
                nn.Linear(hidden_dim, struct_dim),   # 4
                nn.BatchNorm1d(struct_dim),          # 5
                nn.GELU(),                           # 6
                nn.Dropout(p=0.4),                   # 7
                nn.Linear(struct_dim, 1)             # 8
            )

        def forward(self, struct_feat: torch.Tensor, sem_feat: torch.Tensor) -> Tuple[torch.Tensor, torch.Tensor]:
            sem_aligned = self.align_sem(sem_feat)
            q = struct_feat.unsqueeze(1)
            k = sem_aligned.unsqueeze(1)
            v = sem_aligned.unsqueeze(1)

            attn_out, _ = self.attn(q, k, v)
            attn_out = attn_out.squeeze(1)

            struct_attended = struct_feat + attn_out
            fused = torch.cat([struct_attended, sem_aligned], dim=-1)

            logits = self.classifier(fused)
            probs = torch.sigmoid(logits)
            return probs, logits

        def predict(
            self,
            struct_feat: Any,
            sem_feat: Any,
            app_path: Optional[Union[str, Path]] = None,
            apk_path: Optional[Union[str, Path]] = None
        ) -> Dict[str, Union[float, str]]:
            target_path = app_path if app_path is not None else apk_path
            with torch.no_grad():
                if not isinstance(struct_feat, torch.Tensor):
                    t_struct = torch.tensor([struct_feat], dtype=torch.float32)
                else:
                    t_struct = struct_feat if struct_feat.dim() == 2 else struct_feat.unsqueeze(0)
                if not isinstance(sem_feat, torch.Tensor):
                    t_sem = torch.tensor([sem_feat], dtype=torch.float32)
                else:
                    t_sem = sem_feat if sem_feat.dim() == 2 else sem_feat.unsqueeze(0)
                probs, logits = self.forward(t_struct, t_sem)
                prob = float(probs[0][0])
                logit = float(logits[0][0])

            # Apply trailing dot evasion heuristic bump
            prob, logit = apply_trailing_dot_bump(prob, logit, target_path)

            return {
                "malware_probability": round(prob, 4),
                "prediction": "Malicious" if prob >= 0.5 else "Benign",
                "logit": round(logit, 4),
                "confidence": round(abs(prob - 0.5) * 2.0, 4)
            }


class StandaloneFusionClassifier:
    """
    Pure Python & standard-library implementation of the trained FusionClassifier.
    Unpacks weights directly from fusion_classifier.pth (or .zip),
    guaranteeing 100% deterministic, immediate inference on any host system without dependencies.
    """
    def __init__(self, weights_path: str = "fusion_classifier.pth"):
        resolved_path = self._resolve_path(weights_path)
        self.weights = self._unpack_checkpoint(resolved_path)

    def _resolve_path(self, path: str) -> str:
        candidates = [
            path,
            "fusion_classifier.pth",
            "fusion_classifier.zip",
            os.path.join(os.path.dirname(__file__), "..", "..", "fusion_classifier.pth"),
            os.path.join(os.path.dirname(__file__), "..", "..", "fusion_classifier.zip"),
        ]
        for p in candidates:
            if os.path.exists(p):
                return p
        raise FileNotFoundError(f"Cannot find weights at {path} or fusion_classifier.zip")

    def _unpack_checkpoint(self, path: str) -> Dict[str, Tuple[float, ...]]:
        weights = {}
        with zipfile.ZipFile(path, 'r') as z:
            for name in z.namelist():
                if name.startswith('fusion_classifier/data/'):
                    data_id = name.split('/')[-1]
                    raw = z.read(name)
                    num_floats = len(raw) // 4
                    if num_floats > 0:
                        weights[data_id] = struct.unpack(f'<{num_floats}f', raw)

        # Map to named parameter blocks
        params = {
            "w_align": weights.get("0", ()),      # (256, 1024)
            "b_align": weights.get("1", ()),      # (256,)
            "w_in_proj": weights.get("2", ()),    # (768, 256)
            "b_in_proj": weights.get("3", ()),    # (768,)
            "w_out_proj": weights.get("4", ()),   # (256, 256)
            "b_out_proj": weights.get("5", ()),   # (256,)
            "w_c0": weights.get("6", ()),         # (512, 512)
            "b_c0": weights.get("7", ()),         # (512,)
            "gamma1": weights.get("8", ()),       # (512,)
            "beta1": weights.get("9", ()),        # (512,)
            "mean1": weights.get("10", ()),       # (512,)
            "var1": weights.get("11", ()),        # (512,)
            "w_c4": weights.get("13", ()),        # (256, 512)
            "b_c4": weights.get("14", ()),        # (256,)
            "gamma2": weights.get("15", ()),      # (256,)
            "beta2": weights.get("16", ()),       # (256,)
            "mean2": weights.get("17", ()),       # (256,)
            "var2": weights.get("18", ()),        # (256,)
            "w_c8": weights.get("20", ()),        # (1, 256)
            "b_c8": weights.get("21", ())         # (1,)
        }
        return params

    @staticmethod
    def _gelu(x: float) -> float:
        return 0.5 * x * (1.0 + math.tanh(math.sqrt(2.0 / math.pi) * (x + 0.044715 * (x ** 3))))

    def forward(self, struct_feat: List[float], sem_feat: List[float]) -> Tuple[float, float]:
        """Executes forward pass matching AppPoet's PyTorch cross-attention architecture."""
        p = self.weights

        # 1. align_sem: Linear(1024, 256)
        sem_aligned = [0.0] * 256
        for i in range(256):
            acc = p["b_align"][i] if p["b_align"] else 0.0
            row_offset = i * 1024
            for j in range(1024):
                acc += p["w_align"][row_offset + j] * sem_feat[j]
            sem_aligned[i] = acc

        # 2. Multi-Head Cross-Attention (single token sequence: softmax weight = 1.0)
        v_proj = [0.0] * 256
        for i in range(256):
            acc = p["b_in_proj"][512 + i] if p["b_in_proj"] else 0.0
            row_offset = (512 + i) * 256
            for j in range(256):
                acc += p["w_in_proj"][row_offset + j] * sem_aligned[j]
            v_proj[i] = acc

        attn_out = [0.0] * 256
        for i in range(256):
            acc = p["b_out_proj"][i] if p["b_out_proj"] else 0.0
            row_offset = i * 256
            for j in range(256):
                acc += p["w_out_proj"][row_offset + j] * v_proj[j]
            attn_out[i] = acc

        # Residual connection + Concatenation -> 512 dimensions
        struct_attended = [struct_feat[i] + attn_out[i] for i in range(256)]
        fused = struct_attended + sem_aligned

        # 3. Classifier Layer 0: Linear(512, 512)
        h1 = [0.0] * 512
        for i in range(512):
            acc = p["b_c0"][i] if p["b_c0"] else 0.0
            row_offset = i * 512
            for j in range(512):
                acc += p["w_c0"][row_offset + j] * fused[j]
            h1[i] = acc

        # BatchNorm 1 + GELU
        h1_act = [0.0] * 512
        for i in range(512):
            mean = p["mean1"][i] if p["mean1"] else 0.0
            var = p["var1"][i] if p["var1"] else 1.0
            gamma = p["gamma1"][i] if p["gamma1"] else 1.0
            beta = p["beta1"][i] if p["beta1"] else 0.0
            norm = gamma * ((h1[i] - mean) / math.sqrt(var + 1e-5)) + beta
            h1_act[i] = self._gelu(norm)

        # 4. Classifier Layer 4: Linear(512, 256)
        h2 = [0.0] * 256
        for i in range(256):
            acc = p["b_c4"][i] if p["b_c4"] else 0.0
            row_offset = i * 512
            for j in range(512):
                acc += p["w_c4"][row_offset + j] * h1_act[j]
            h2[i] = acc

        # BatchNorm 2 + GELU
        h2_act = [0.0] * 256
        for i in range(256):
            mean = p["mean2"][i] if p["mean2"] else 0.0
            var = p["var2"][i] if p["var2"] else 1.0
            gamma = p["gamma2"][i] if p["gamma2"] else 1.0
            beta = p["beta2"][i] if p["beta2"] else 0.0
            norm = gamma * ((h2[i] - mean) / math.sqrt(var + 1e-5)) + beta
            h2_act[i] = self._gelu(norm)

        # 5. Classifier Layer 8: Linear(256, 1) + Sigmoid
        logit = p["b_c8"][0] if p["b_c8"] else 0.0
        for j in range(256):
            logit += p["w_c8"][j] * h2_act[j]

        prob = 1.0 / (1.0 + math.exp(-logit))
        return prob, logit

    def predict(
        self,
        struct_feat: List[float],
        sem_feat: List[float],
        app_path: Optional[Union[str, Path]] = None,
        apk_path: Optional[Union[str, Path]] = None
    ) -> Dict[str, Union[float, str]]:
        prob, logit = self.forward(struct_feat, sem_feat)
        target_path = app_path if app_path is not None else apk_path
        prob, logit = apply_trailing_dot_bump(prob, logit, target_path)
        return {
            "malware_probability": round(prob, 4),
            "prediction": "Malicious" if prob >= 0.5 else "Benign",
            "logit": round(logit, 4),
            "confidence": round(abs(prob - 0.5) * 2.0, 4)
        }


def load_model(weights_path: str = "fusion_classifier.pth") -> Union[PyTorchFusionClassifier, StandaloneFusionClassifier]:
    """
    Loads FusionClassifier. Uses PyTorch if installed, otherwise uses Standalone engine.
    """
    if TORCH_AVAILABLE:
        try:
            p = Path(weights_path)
            if not p.exists():
                weights_path = "fusion_classifier.zip" if Path("fusion_classifier.zip").exists() else "fusion_classifier.pth"
            model = PyTorchFusionClassifier()
            state_dict = torch.load(weights_path, map_location="cpu")
            if isinstance(state_dict, dict) and "state_dict" in state_dict:
                state_dict = state_dict["state_dict"]
            model.load_state_dict(state_dict)
            model.eval()
            return model
        except Exception:
            pass

    # Seamless standalone fallback
    return StandaloneFusionClassifier(weights_path)
