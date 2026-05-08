import torch
import torch.nn as nn
import torch.optim as optim
import os

class PyTorchMLP(nn.Module):
    def __init__(self, input_dim=384, hidden_dim=128, output_dim=1, model_path=None):
        """
        MLP for App Analysis
        Input: 384 dimensions (single semantic embedding)
        Architecture: 384 → 128 → 1 (matches saved weights)
        """
        super(PyTorchMLP, self).__init__()
        
        # Architecture matches saved weights exactly
        self.layer1 = nn.Linear(input_dim, hidden_dim)
        self.relu1 = nn.ReLU()
        self.dropout1 = nn.Dropout(0.3)
        
        self.layer2 = nn.Linear(hidden_dim, output_dim)
        self.sigmoid = nn.Sigmoid()
        
        self.criterion = nn.BCELoss()
        self.optimizer = optim.Adam(self.parameters(), lr=0.001)
        self.model_path = model_path
        
        if model_path and os.path.exists(model_path):
            self.load_state_dict(torch.load(model_path, map_location=torch.device('cpu')))
            print(f"Warm-start: Loaded model weights from {model_path}")
    
    def forward(self, x):
        x = self.layer1(x)
        x = self.relu1(x)
        x = self.dropout1(x)
        x = self.layer2(x)
        x = self.sigmoid(x)
        return x
    
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
