import numpy as np
from sentence_transformers import SentenceTransformer

class TextEmbedder:
    def __init__(self, model_name='all-MiniLM-L6-v2'):
        self.model = SentenceTransformer(model_name)
        self.embedding_dim = 384
    
    def embed_text(self, text):
        embedding = self.model.encode(text, convert_to_numpy=True, show_progress_bar=False)
        return embedding.astype(np.float32)
    
    def embed_batch(self, texts):
        embeddings = self.model.encode(texts, convert_to_numpy=True, show_progress_bar=False)
        return embeddings.astype(np.float32)
    
    def combine_embeddings(self, embeddings):
        return np.concatenate(embeddings, axis=0) if len(embeddings) > 1 else embeddings[0]
