import sys
import os

# Handle imports when run as script vs module
if __name__ == "__main__":
    sys.path.insert(0, os.path.dirname(os.path.dirname(os.path.abspath(__file__))))
    from llm_engine.prompt_templates import PromptTemplates
else:
    from .prompt_templates import PromptTemplates

import ollama

class LocalOllamaInterface:
    """
    Air-gapped local LLM interface using Ollama.
    Queries local qwen2.5-coder model for behavioral analysis.
    """
    def __init__(self, model="qwen2.5-coder"):
        self.model = model
        self.system_prompt = """You are a cybersecurity expert analyzing Android applications. 
Generate semantic, descriptive Behavioral Summaries and Function Descriptions. 
Provide cohesive paragraphs describing app behavior. Do not use bullet points or comma-separated lists."""
    
    def generate(self, prompt, max_tokens=400, temperature=0.2):
        """Generate text using local Ollama model."""
        try:
            # Setting timeout=None on local ollama library calls isn't explicitly supported or needed 
            # as it uses standard urllib / requests internally. If using client-level configurations,
            # we simply ensure no options limit the connection length.
            response = ollama.chat(
                model=self.model,
                messages=[
                    {"role": "system", "content": self.system_prompt},
                    {"role": "user", "content": prompt[:3000] if len(prompt) > 3000 else prompt}
                ],
                options={
                    "temperature": temperature,
                    "num_predict": max_tokens
                }
            )
            return response['message']['content']
        except Exception as e:
            print(f"Ollama generation error: {e}")
            return f"Error: {str(e)}"
    
    def generate_heuristic_report(self, perm_summary, api_summary, url_summary):
        """Generate comprehensive Heuristic Diagnostic Report from 3-view summaries."""
        templates = PromptTemplates()
        
        diagnostic_prompt = templates.DIAGNOSTIC_REPORT.format(
            permission_summary=perm_summary,
            api_summary=api_summary,
            url_summary=url_summary
        )
        
        return self.generate(diagnostic_prompt)
    
    def analyze_views(self, permissions, api_calls, urls):
        """
        Analyze 3 views and return behavioral summaries.
        
        Returns:
            tuple: (perm_summary, api_summary, url_summary, diagnostic_report)
        """
        templates = PromptTemplates()
        
        # Generate behavioral summaries for each view
        perm_prompt = templates.PERMISSION_VIEW.format(permissions=permissions)
        api_prompt = templates.API_VIEW.format(api_calls=api_calls)
        url_prompt = templates.URL_VIEW.format(urls=urls)
        
        print("  Analyzing Permission View via local Ollama...")
        perm_summary = self.generate(perm_prompt)
        
        print("  Analyzing API View via local Ollama...")
        api_summary = self.generate(api_prompt)
        
        print("  Analyzing URL/Component View via local Ollama...")
        url_summary = self.generate(url_prompt)
        
        print("  Generating Heuristic Diagnostic Report...")
        diagnostic_report = self.generate_heuristic_report(perm_summary, api_summary, url_summary)
        
        return perm_summary, api_summary, url_summary, diagnostic_report
