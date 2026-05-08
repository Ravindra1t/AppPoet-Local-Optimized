import sys
import os
sys.path.append(os.path.join(os.path.dirname(__file__), 'src'))

from src.orchestrator.pipeline_kaggle import PipelineKaggle
import warnings
warnings.filterwarnings('ignore')

def main():
    print("=== AppPoet Training Pipeline Demo ===")
    print("Initializing pipeline components...")
    
    pipeline = PipelineKaggle()
    
    print("Loading sample Kaggle data...")
    data_path = os.path.join('data', 'kaggle_data.csv')
    
    print("Starting training process...")
    print("Note: This demo uses mock LLM responses since qwen2.5-coder:7b is not running")
    
    class MockQwen:
        def generate(self, prompt):
            if 'permissions' in prompt.lower():
                return "High risk permissions detected including phone state access and SMS capabilities"
            elif 'api' in prompt.lower():
                return "Runtime execution and SMS API calls present potential security risks"
            elif 'url' in prompt.lower():
                return "Suspicious URLs detected with potential malicious domains"
            else:
                return "Comprehensive analysis indicates moderate to high vulnerability risk"
    
    pipeline.qwen = MockQwen()
    
    print("Training model on sample data...")
    trained_model = pipeline.train_model(data_path, epochs=5)
    
    print("Training completed!")
    print("Model saved as 'vulnerability_classifier.pth'")
    print("Ready for APK analysis pipeline")

if __name__ == "__main__":
    main()
