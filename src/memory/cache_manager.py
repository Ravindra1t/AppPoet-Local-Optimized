import json
import hashlib
import os

class CacheManager:
    def __init__(self, cache_file='cache.json'):
        self.cache_file = cache_file
        self.cache = {}
        if os.path.exists(cache_file):
            with open(cache_file, 'r') as f:
                self.cache = json.load(f)
    
    def _generate_key(self, data):
        return hashlib.md5(json.dumps(data, sort_keys=True).encode()).hexdigest()
    
    def get(self, key):
        return self.cache.get(key)
    
    def set(self, key, value):
        self.cache[key] = value
        with open(self.cache_file, 'w') as f:
            json.dump(self.cache, f)
    
    def get_or_compute(self, data, compute_func):
        key = self._generate_key(data)
        cached_result = self.get(key)
        if cached_result is not None:
            return cached_result
        result = compute_func(data)
        self.set(key, result)
        return result
