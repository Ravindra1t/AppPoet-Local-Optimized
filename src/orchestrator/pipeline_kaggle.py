import sys
import os
sys.path.append(os.path.dirname(os.path.dirname(os.path.abspath(__file__))))

from extraction.kaggle_loader import KaggleLoader
from llm_engine.prompt_templates import PromptTemplates
from llm_engine.qwen_interface import QwenInterface
from classifier.text_embedder import TextEmbedder
from classifier.pytorch_mlp import PyTorchMLP
import torch
import numpy as np

class PipelineKaggle:
    def __init__(self):
        self.loader = KaggleLoader()
        self.qwen = QwenInterface()
        self.embedder = TextEmbedder()
        self.model = PyTorchMLP()
        self.templates = PromptTemplates()
    
    def generate_view_summaries(self, data):
        permission_summaries = []
        api_summaries = []
        url_summaries = []
        
        for item in data:
            perm_prompt = self.templates.PERMISSION_VIEW.format(permissions=item['permissions'])
            api_prompt = self.templates.API_VIEW.format(api_calls=item['api_calls'])
            url_prompt = self.templates.URL_VIEW.format(urls=item['urls'])
            
            permission_summaries.append(self.qwen.generate(perm_prompt))
            api_summaries.append(self.qwen.generate(api_prompt))
            url_summaries.append(self.qwen.generate(url_prompt))
        
        return permission_summaries, api_summaries, url_summaries
    
    def create_embeddings(self, permission_summaries, api_summaries, url_summaries):
        combined_embeddings = []
        for i in range(len(permission_summaries)):
            perm_emb = self.embedder.embed_text(permission_summaries[i])
            api_emb = self.embedder.embed_text(api_summaries[i])
            url_emb = self.embedder.embed_text(url_summaries[i])
            combined = np.concatenate([perm_emb, api_emb, url_emb])
            combined_embeddings.append(combined)
        return np.array(combined_embeddings)
    
    def train_model(self, data_path, epochs=10):
        data = self.loader.load_data(data_path)
        permission_summaries, api_summaries, url_summaries = self.generate_view_summaries(data)
        embeddings = self.create_embeddings(permission_summaries, api_summaries, url_summaries)
        
        labels = torch.tensor([item['vulnerability_label'] for item in data], dtype=torch.float32).unsqueeze(1)
        inputs = torch.tensor(embeddings, dtype=torch.float32)
        
        for epoch in range(epochs):
            total_loss = 0
            for i in range(len(inputs)):
                loss = self.model.train_step(inputs[i:i+1], labels[i:i+1])
                total_loss += loss
            print(f"Epoch {epoch+1}, Loss: {total_loss/len(inputs):.4f}")
        
        self.model.save_model('vulnerability_classifier.pth')
        return self.model
    
    def evaluate(self, test_data):
        permission_summaries, api_summaries, url_summaries = self.generate_view_summaries(test_data)
        embeddings = self.create_embeddings(permission_summaries, api_summaries, url_summaries)
        inputs = torch.tensor(embeddings, dtype=torch.float32)
        
        predictions = self.model.predict(inputs)
        return predictions.numpy()
