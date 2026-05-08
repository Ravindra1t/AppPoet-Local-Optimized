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
from tqdm import tqdm

GROQ_API_KEY = os.environ.get("GROQ_API_KEY")

class KagglePrototypePipeline:
    """
    AppPoet Multi-View Analysis Pipeline
    
    Architecture (per AppPoet paper):
    1. Multi-View Feature Extraction: Permission View, API View, URL/Component View
    2. LLM Behavioral Summary: Groq generates semantic summaries for each view
    3. Semantic Embedding: sentence-transformers (all-MiniLM-L6-v2) → 384-dim vectors
    4. View Fusion: Concatenate 3 views → 1152-dim input
    5. MLP Classification: Binary malware/benign prediction
    6. Heuristic Diagnostic Report: Full LLM-generated analysis output
    """
    
    def __init__(self, groq_api_key):
        self.loader = KaggleLoader()
        self.groq = GroqInterface(api_key=groq_api_key)
        self.embedder = TextEmbedder()  # Uses all-MiniLM-L6-v2 for semantic embeddings
        self.templates = PromptTemplates()
        self.models_dir = "../../models"
        self.model_path = os.path.join(self.models_dir, "apppoet_mlp.pth")
        os.makedirs(self.models_dir, exist_ok=True)
        # MLP input: 1152 = 3 views × 384-dim semantic embeddings
        self.model = PyTorchMLP(input_dim=1152, model_path=self.model_path)
    
    def load_balanced_samples(self, csv_path, num_samples=100):
        data = self.loader.load_data(csv_path)
        malicious = [item for item in data if item['vulnerability_label'] == 1]
        benign = [item for item in data if item['vulnerability_label'] == 0]
        
        samples_per_class = num_samples // 2
        selected_malicious = malicious[:samples_per_class]
        selected_benign = benign[:samples_per_class]
        
        balanced_data = selected_malicious + selected_benign
        labels = [1] * len(selected_malicious) + [0] * len(selected_benign)
        
        return balanced_data, labels
    
    def process_sample(self, item):
        """
        Process a single sample through Multi-View analysis pipeline:
        1. Generate Behavioral Summaries for each view via Groq LLM
        2. Create semantic embeddings using sentence-transformers
        3. Fuse views by concatenation
        4. Generate Heuristic Diagnostic Report
        """
        try:
            # Multi-View Prompt Engineering: Generate Behavioral Summaries
            perm_prompt = self.templates.PERMISSION_VIEW.format(permissions=item['permissions'])
            api_prompt = self.templates.API_VIEW.format(api_calls=item['api_calls'])
            url_prompt = self.templates.URL_VIEW.format(urls=item['urls'])
            
            # LLM generates semantic Behavioral Summaries (not comma-separated lists)
            perm_summary = self.groq.generate(perm_prompt)  # Permission View Summary
            api_summary = self.groq.generate(api_prompt)    # API View Summary  
            url_summary = self.groq.generate(url_prompt)    # URL/Component View Summary
            
            # True Semantic Embeddings using sentence-transformers (all-MiniLM-L6-v2)
            # Each view produces a dense 384-dimensional semantic vector
            perm_emb = self.embedder.embed_text(perm_summary)
            api_emb = self.embedder.embed_text(api_summary)
            url_emb = self.embedder.embed_text(url_summary)
            
            # View Fusion: Concatenate 3 views → 1152-dim input for MLP
            combined = np.concatenate([perm_emb, api_emb, url_emb])
            
            # Generate Heuristic Diagnostic Report
            diagnostic_prompt = self.templates.DIAGNOSTIC_REPORT.format(
                permission_summary=perm_summary,
                api_summary=api_summary,
                url_summary=url_summary
            )
            diagnostic_report = self.groq.generate(diagnostic_prompt)
            
            return {
                'embedding': combined,
                'perm_summary': perm_summary,
                'api_summary': api_summary,
                'url_summary': url_summary,
                'diagnostic_report': diagnostic_report
            }
        except Exception as e:
            print(f"Error processing sample {item.get('app_name', 'unknown')}: {e}")
            return None
    
    def run_pipeline(self, csv_path, num_samples=100, epochs=10):
        """
        Execute full Multi-View AppPoet training pipeline
        """
        print("=" * 60)
        print("AppPoet Kaggle Prototype Pipeline")
        print("Multi-View Architecture: Permission + API + URL/Component Views")
        print("Semantic Embeddings: sentence-transformers (all-MiniLM-L6-v2)")
        print("=" * 60)
        print(f"Loading {num_samples} balanced samples (50 malicious, 50 benign)")
        
        data, labels = self.load_balanced_samples(csv_path, num_samples)
        print(f"Loaded {len(data)} samples from CSV")
        
        embeddings = []
        valid_labels = []
        diagnostic_reports = []
        
        print("\nProcessing samples through Multi-View Groq LLM analysis...")
        print("Generating Behavioral Summaries and Heuristic Diagnostic Reports...")
        
        for item, label in tqdm(zip(data, labels), total=len(data), desc="Processing"):
            result = self.process_sample(item)
            if result is not None:
                embeddings.append(result['embedding'])
                valid_labels.append(label)
                diagnostic_reports.append({
                    'app_name': item['app_name'],
                    'label': label,
                    'report': result['diagnostic_report']
                })
        
        if len(embeddings) == 0:
            print("No valid embeddings generated. Exiting.")
            return
        
        print(f"\nSuccessfully processed {len(embeddings)}/{len(data)} samples")
        print(f"Generated {len(diagnostic_reports)} Heuristic Diagnostic Reports")
        
        # Prepare tensors for training
        embeddings_array = np.array(embeddings)
        labels_tensor = torch.tensor(valid_labels, dtype=torch.float32).unsqueeze(1)
        inputs_tensor = torch.tensor(embeddings_array, dtype=torch.float32)
        
        print(f"\nTraining neural network with {len(embeddings)} samples...")
        print(f"Input shape: {inputs_tensor.shape} (3 views × 384-dim semantic embeddings)")
        print(f"Labels shape: {labels_tensor.shape}")
        
        for epoch in range(epochs):
            total_loss = 0
            for i in range(len(inputs_tensor)):
                loss = self.model.train_step(inputs_tensor[i:i+1], labels_tensor[i:i+1])
                total_loss += loss
            avg_loss = total_loss / len(inputs_tensor)
            print(f"Epoch {epoch+1}/{epochs}, Loss: {avg_loss:.4f}")
        
        self.model.save_model()
        
        # Save sample diagnostic reports for review
        reports_dir = "../../reports"
        os.makedirs(reports_dir, exist_ok=True)
        for i, report in enumerate(diagnostic_reports[:5]):  # Save first 5 reports
            report_path = os.path.join(reports_dir, f"training_diagnostic_{report['app_name']}.txt")
            with open(report_path, 'w', encoding='utf-8') as f:
                f.write(f"App: {report['app_name']}\n")
                f.write(f"Label: {'MALICIOUS' if report['label'] == 1 else 'BENIGN'}\n\n")
                f.write("HEURISTIC DIAGNOSTIC REPORT\n")
                f.write("=" * 60 + "\n\n")
                f.write(report['report'])
        
        print("\n" + "=" * 60)
        print("Pipeline completed successfully")
        print(f"Model weights saved to {self.model_path}")
        print(f"Final training loss: {avg_loss:.4f}")
        print(f"Sample diagnostic reports saved to {reports_dir}")
        print("=" * 60)

if __name__ == "__main__":
    if not GROQ_API_KEY:
        print("ERROR: Please set GROQ_API_KEY at the top of this script")
        sys.exit(1)
    
    pipeline = KagglePrototypePipeline(groq_api_key=GROQ_API_KEY)
    pipeline.run_pipeline("../../data/drebin-215-dataset-5560malware-9476-benign.csv", num_samples=10, epochs=10)
