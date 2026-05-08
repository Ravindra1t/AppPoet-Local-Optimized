import sys
import os
sys.path.append(os.path.dirname(os.path.dirname(os.path.abspath(__file__))))

from extraction.apktool_decoder import APKToolDecoder
from extraction.androguard_parser import AndroguardParser
from memory.cache_manager import CacheManager
from llm_engine.prompt_templates import PromptTemplates
from llm_engine.qwen_interface import GroqInterface as QwenInterface
from classifier.text_embedder import TextEmbedder
from classifier.pytorch_mlp import PyTorchMLP
import torch
import numpy as np

class PipelineLocalAPK:
    def __init__(self):
        self.apktool = APKToolDecoder('temp_decompiled')
        self.androguard = AndroguardParser()
        self.cache = CacheManager()
        self.qwen = QwenInterface(api_key="dummy_key")
        self.embedder = TextEmbedder()
        self.model = PyTorchMLP()
        self.templates = PromptTemplates()
        model_path = os.path.join(os.path.dirname(os.path.dirname(os.path.dirname(__file__))), 'models', 'apppoet_mlp_weights.pth')
        self.model.load_model(model_path)
    
    def extract_features(self, apk_path):
        apktool_data = self.apktool.decode_apk(apk_path)
        androguard_data = self.androguard.parse_apk(apk_path)
        
        features = {
            'permissions': apktool_data['permissions'],
            'activities': apktool_data['activities'],
            'services': apktool_data['services'],
            'receivers': apktool_data['receivers'],
            'methods': androguard_data['methods'],
            'restricted_apis': androguard_data['restricted_apis'],
            'package_name': androguard_data['package_name'],
            'version_code': androguard_data['version_code'],
            'version_name': androguard_data['version_name']
        }
        return features
    
    def generate_cached_summary(self, feature_type, data):
        def compute_summary(input_data):
            if feature_type == 'permissions':
                prompt = self.templates.PERMISSION_VIEW.format(permissions=str(input_data))
            elif feature_type == 'apis':
                prompt = self.templates.API_VIEW.format(api_calls=str(input_data))
            elif feature_type == 'urls':
                prompt = self.templates.URL_VIEW.format(urls=str(input_data))
            else:
                return ''
            return self.qwen.generate(prompt)
        
        return self.cache.get_or_compute(data, compute_summary)
    
    def analyze_apk(self, apk_path):
        features = self.extract_features(apk_path)
        
        permission_summary = self.generate_cached_summary('permissions', features['permissions'])
        api_summary = self.generate_cached_summary('apis', features['restricted_apis'])
        url_summary = self.generate_cached_summary('urls', [])
        
        perm_emb = self.embedder.embed_text(permission_summary)
        api_emb = self.embedder.embed_text(api_summary)
        url_emb = self.embedder.embed_text(url_summary)
        
        combined_embedding = np.concatenate([perm_emb, api_emb, url_emb])
        input_tensor = torch.tensor(combined_embedding, dtype=torch.float32).unsqueeze(0)
        
        vulnerability_score = self.model.predict(input_tensor).item()
        
        diagnostic_prompt = self.templates.DIAGNOSTIC_REPORT.format(
            permission_summary=permission_summary,
            api_summary=api_summary,
            url_summary=url_summary
        )
        diagnostic_report = self.qwen.generate(diagnostic_prompt)
        
        return {
            'apk_path': apk_path,
            'package_name': features['package_name'],
            'vulnerability_score': vulnerability_score,
            'risk_level': 'Critical' if vulnerability_score > 0.8 else 'High' if vulnerability_score > 0.6 else 'Medium' if vulnerability_score > 0.4 else 'Low',
            'diagnostic_report': diagnostic_report,
            'features': features
        }
    
    def batch_analyze(self, apk_paths):
        results = []
        for apk_path in apk_paths:
            try:
                result = self.analyze_apk(apk_path)
                results.append(result)
            except Exception as e:
                results.append({'apk_path': apk_path, 'error': str(e)})
        return results
