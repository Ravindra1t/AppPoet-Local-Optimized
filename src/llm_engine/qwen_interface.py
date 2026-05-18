import sys
import os

# Handle imports when run as script vs module
if __name__ == "__main__":
    sys.path.insert(0, os.path.dirname(os.path.dirname(os.path.abspath(__file__))))
    from llm_engine.prompt_templates import PromptTemplates
else:
    from .prompt_templates import PromptTemplates

from groq import Groq

class GroqInterface:
    """
    Groq API client interface for lightning-fast behavioral summaries.
    """
    def __init__(self, api_key=None, model="llama-3.1-8b-instant"):
        self.api_key = api_key
        
        # 1. Fallback to reading from local secure .env file in project root
        if not self.api_key:
            env_path = os.path.join(os.path.dirname(os.path.dirname(os.path.dirname(os.path.abspath(__file__)))), ".env")
            if os.path.exists(env_path):
                try:
                    with open(env_path, "r", encoding="utf-8") as f:
                        for line in f:
                            if line.strip().startswith("GROQ_API_KEY="):
                                self.api_key = line.strip().split("=", 1)[1].strip()
                                break
                except Exception:
                    pass
                    
        # 2. Fallback to OS Environment Variables
        if not self.api_key:
            self.api_key = os.environ.get("GROQ_API_KEY")
            
        if not self.api_key:
            raise ValueError("[ERROR] GROQ_API_KEY is not set. Please set it in a local .env file or your environment variables.")
            
        self.client = Groq(api_key=self.api_key)
        self.model = model
        self.system_prompt = "You are a security analysis expert. Generate semantic, descriptive Behavioral Summaries and Function Descriptions. Do not use bullet points or comma-separated lists. Provide cohesive paragraphs describing app behavior."
        self.max_tokens = 400
        self.temperature = 0.2
    
    def generate(self, prompt, max_tokens=None, temperature=None):
        truncated_prompt = prompt[:3000] if len(prompt) > 3000 else prompt
        response = self.client.chat.completions.create(
            model=self.model,
            messages=[
                {"role": "system", "content": self.system_prompt},
                {"role": "user", "content": truncated_prompt}
            ],
            max_tokens=max_tokens if max_tokens else self.max_tokens,
            temperature=temperature if temperature else self.temperature
        )
        return response.choices[0].message.content
    
    def generate_batch(self, prompts):
        results = []
        for prompt in prompts:
            result = self.generate(prompt)
            results.append(result)
        return results
    
    def analyze_views(self, perm_view, api_view, url_view):
        """Analyze 3 views and generate behavioral summaries + diagnostic report."""
        templates = PromptTemplates()
        
        # Generate summaries for each view
        perm_prompt = templates.PERMISSION_VIEW.format(permissions=perm_view)
        api_prompt = templates.API_VIEW.format(api_calls=api_view)
        url_prompt = templates.URL_VIEW.format(urls=url_view)
        
        perm_summary = self.generate(perm_prompt)
        api_summary = self.generate(api_prompt)
        url_summary = self.generate(url_prompt)
        
        # Generate diagnostic report
        diagnostic_prompt = templates.DIAGNOSTIC_REPORT.format(
            permission_summary=perm_summary,
            api_summary=api_summary,
            url_summary=url_summary
        )
        diagnostic_report = self.generate(diagnostic_prompt)
        
        return perm_summary, api_summary, url_summary, diagnostic_report
        
    def generate_consolidated_report(self, perm_view, api_view, url_view):
        templates = PromptTemplates()
        prompt = templates.SINGLE_CONSOLIDATED_REPORT.format(
            permissions=perm_view,
            api_calls=api_view,
            urls=url_view
        )
        return self.generate(prompt)
