import sys
import os
sys.path.append(os.path.dirname(os.path.dirname(os.path.abspath(__file__))))

from extraction.kaggle_loader import KaggleLoader
from llm_engine.prompt_templates import PromptTemplates
from llm_engine.qwen_interface import GroqInterface
from classifier.text_embedder import TextEmbedder
from classifier.pytorch_mlp import PyTorchMLP
import torch
import numpy as np

GROQ_API_KEY = os.environ.get("GROQ_API_KEY")

class InferencePipeline:
    def __init__(self, groq_api_key, model_path, report_dir="../../reports"):
        self.loader = KaggleLoader()
        self.groq = GroqInterface(api_key=groq_api_key)
        self.embedder = TextEmbedder()
        self.templates = PromptTemplates()
        self.model = PyTorchMLP(model_path=model_path)
        self.model.eval()
        self.report_dir = report_dir
        os.makedirs(self.report_dir, exist_ok=True)
    
    def process_sample(self, item):
        perm_prompt = self.templates.PERMISSION_VIEW.format(permissions=item['permissions'])
        api_prompt = self.templates.API_VIEW.format(api_calls=item['api_calls'])
        url_prompt = self.templates.URL_VIEW.format(urls=item['urls'])
        
        perm_summary = self.groq.generate(perm_prompt)
        api_summary = self.groq.generate(api_prompt)
        url_summary = self.groq.generate(url_prompt)
        
        perm_emb = self.embedder.embed_text(perm_summary)
        api_emb = self.embedder.embed_text(api_summary)
        url_emb = self.embedder.embed_text(url_summary)
        
        combined = np.concatenate([perm_emb, api_emb, url_emb])
        return combined, perm_summary, api_summary, url_summary
    
    def predict(self, csv_path, row_index=0):
        print("=" * 60)
        print("AppPoet Inference Pipeline")
        print("=" * 60)
        
        data = self.loader.load_data(csv_path)
        if row_index >= len(data):
            print(f"Error: Row index {row_index} out of range (CSV has {len(data)} rows)")
            return
        
        item = data[row_index]
        print(f"\nProcessing sample: {item['app_name']}")
        print(f"Actual label: {'MALICIOUS' if item['vulnerability_label'] == 1 else 'BENIGN'}")
        
        print("\nGenerating LLM summaries via Groq...")
        embedding, perm_summary, api_summary, url_summary = self.process_sample(item)
        
        input_tensor = torch.tensor(embedding, dtype=torch.float32).unsqueeze(0)
        
        print("\nRunning inference...")
        with torch.no_grad():
            prediction = self.model.predict(input_tensor)
        
        probability = prediction.item()
        predicted_label = 1 if probability >= 0.5 else 0
        
        print("\n" + "=" * 60)
        print("Inference Results")
        print("=" * 60)
        print(f"Sample: {item['app_name']}")
        print(f"Actual Label: {'MALICIOUS' if item['vulnerability_label'] == 1 else 'BENIGN'}")
        print(f"Predicted Label: {'MALICIOUS' if predicted_label == 1 else 'BENIGN'}")
        print(f"Probability: {probability:.4f}")
        print(f"Correct: {'YES' if predicted_label == item['vulnerability_label'] else 'NO'}")
        print("=" * 60)
        
        report_content = f"""AppPoet Inference Report
{'=' * 60}
Sample Name: {item['app_name']}
Timestamp: {np.datetime64('now')}

INPUT DATA
----------
Permissions: {item['permissions']}
API Calls: {item['api_calls']}
URLs: {item['urls']}
Actual Label: {'MALICIOUS' if item['vulnerability_label'] == 1 else 'BENIGN'}

LLM ANALYSIS (Groq - llama-3.1-8b-instant)
------------------------------------------
Permission Analysis:
{perm_summary}

API Analysis:
{api_summary}

URL Analysis:
{url_summary}

INFERENCE RESULTS
-----------------
Predicted Label: {'MALICIOUS' if predicted_label == 1 else 'BENIGN'}
Probability: {probability:.4f}
Correct: {'YES' if predicted_label == item['vulnerability_label'] else 'NO'}
{'=' * 60}
"""
        
        report_filename = f"inference_{item['app_name']}_{row_index}.txt"
        report_path = os.path.join(self.report_dir, report_filename)
        
        with open(report_path, 'w', encoding='utf-8') as f:
            f.write(report_content)
        
        print(f"\nReport saved to: {report_path}")
        
        return predicted_label, probability

if __name__ == "__main__":
    model_path = "../../models/apppoet_mlp.pth"
    pipeline = InferencePipeline(groq_api_key=GROQ_API_KEY, model_path=model_path)
    pipeline.predict("../../data/drebin-215-dataset-5560malware-9476-benign.csv", row_index=0)
