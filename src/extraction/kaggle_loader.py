import pandas as pd
import numpy as np

class KaggleLoader:
    def __init__(self):
        pass
    
    def load_data(self, csv_path):
        df = pd.read_csv(csv_path, header=None)
        feature_names = df.iloc[0].values
        data_rows = df.iloc[1:].values
        
        samples = []
        for row in data_rows:
            features = row[:-1]
            label = row[-1]
            
            permissions = []
            api_calls = []
            urls = []
            
            for i, val in enumerate(features):
                if val == 1 and i < len(feature_names):
                    feature_name = feature_names[i]
                    if 'permission' in str(feature_name).lower() or feature_name.isupper():
                        permissions.append(str(feature_name))
                    elif '.' in str(feature_name) or 'L' in str(feature_name):
                        api_calls.append(str(feature_name))
                    elif 'http' in str(feature_name).lower():
                        urls.append(str(feature_name))
            
            vulnerability_label = 1 if label != 'S' else 0
            
            samples.append({
                'app_name': f"sample_{len(samples)}",
                'permissions': ','.join(permissions),
                'api_calls': ','.join(api_calls),
                'urls': ','.join(urls),
                'vulnerability_label': vulnerability_label
            })
        
        return samples
