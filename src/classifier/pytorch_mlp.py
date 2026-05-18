import torch
import torch.nn as nn
import torch.optim as optim
import os

class PyTorchMLP(nn.Module):
    def __init__(self, input_dim, hidden_dim=512, output_dim=1, model_path=None):
        """
        MLP for App Analysis matching the exact saved architecture in state_dict.
        Architecture: Input (input_dim) -> Linear (512) -> ReLU -> Dropout -> Linear (256) -> ReLU -> Dropout -> Linear (128) -> ReLU -> Linear (1) -> Sigmoid
        """
        super(PyTorchMLP, self).__init__()
        
        # Exact architecture and module keys matching:
        # 'network.0.weight' [512, 1152], 'network.0.bias' [512]
        # 'network.3.weight' [256, 512], 'network.3.bias' [256]
        # 'network.6.weight' [128, 256], 'network.6.bias' [128]
        # 'network.8.weight' [1, 128], 'network.8.bias' [1]
        self.network = nn.Sequential(
            nn.Linear(input_dim, hidden_dim), # 0
            nn.ReLU(),                        # 1
            nn.Dropout(0.3),                  # 2
            nn.Linear(hidden_dim, 256),       # 3
            nn.ReLU(),                        # 4
            nn.Dropout(0.3),                  # 5
            nn.Linear(256, 128),              # 6
            nn.ReLU(),                        # 7
            nn.Linear(128, output_dim),       # 8
            nn.Sigmoid()                      # 9
        )
        
        self.criterion = nn.BCELoss()
        self.optimizer = optim.Adam(self.parameters(), lr=0.001)
        self.model_path = model_path
        
        if model_path and os.path.exists(model_path):
            self.load_state_dict(torch.load(model_path, map_location=torch.device('cpu')))
            print(f"Warm-start: Loaded model weights from {model_path}")
            
    @property
    def layer1(self):
        return self.network[0]
            
    def forward(self, x):
        return self.network(x)
    
    def train_step(self, inputs, targets):
        self.optimizer.zero_grad()
        outputs = self.forward(inputs)
        loss = self.criterion(outputs, targets)
        loss.backward()
        self.optimizer.step()
        return loss.item()
    
    def predict(self, inputs):
        self.eval()
        with torch.no_grad():
            return self.forward(inputs)
    
    def save_model(self, path=None):
        save_path = path if path else self.model_path
        if save_path:
            torch.save(self.state_dict(), save_path)
            print(f"Model weights saved to {save_path}")
    
    def load_model(self, path):
        self.load_state_dict(torch.load(path, map_location=torch.device('cpu')))

