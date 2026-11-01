"""
AppPoet DeepSAGE Graph Neural Network Encoder
Encodes whole-program Dalvik Function Call Graphs into 256-D graph embeddings using GraphSAGE.
"""

from __future__ import annotations

from typing import Optional

try:
    import torch
    import torch.nn as nn
    from torch_geometric.nn import SAGEConv, global_mean_pool
    PYG_AVAILABLE = True
except ImportError:
    PYG_AVAILABLE = False


if PYG_AVAILABLE:
    class DeepSAGEEncoder(nn.Module):
        """
        3-Layer Inductive GraphSAGE Encoder with BatchNorm and GELU activations.
        Maps Dalvik Function Call Graphs to a 256-D graph vector.
        """
        def __init__(self, in_dim: int = 32, hidden_dim: int = 128, out_dim: int = 256):
            super(DeepSAGEEncoder, self).__init__()
            self.conv1 = SAGEConv(in_dim, hidden_dim)
            self.bn1 = nn.BatchNorm1d(hidden_dim)
            self.conv2 = SAGEConv(hidden_dim, hidden_dim)
            self.bn2 = nn.BatchNorm1d(hidden_dim)
            self.conv3 = SAGEConv(hidden_dim, out_dim)
            self.bn3 = nn.BatchNorm1d(out_dim)
            self.gelu = nn.GELU()

        def forward(self, x: torch.Tensor, edge_index: torch.Tensor, batch: Optional[torch.Tensor] = None) -> torch.Tensor:
            if x.size(0) == 0:
                return torch.zeros((0, 256), device=x.device)
            x = self.gelu(self.bn1(self.conv1(x, edge_index)))
            x = x + self.gelu(self.bn2(self.conv2(x, edge_index)))
            z = self.bn3(self.conv3(x, edge_index))
            if batch is not None:
                return global_mean_pool(z, batch)
            return torch.mean(z, dim=0, keepdim=True)
else:
    class DeepSAGEEncoder:
        def __init__(self, *args, **kwargs):
            raise ImportError("torch and torch_geometric are required to use DeepSAGEEncoder.")
