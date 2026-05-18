import json
import requests
import re
import base64

def extract_obfuscated_blocks(dx):
    """
    Optimized Hybrid symbolic extraction of obfuscated blocks using Androguard Analysis (dx).
    1. Filters out noisy boilerplate class packages.
    2. Runs a programmatic Python Base64 deobfuscation pass (zero-latency).
    3. Returns remaining high-value blocks for selective local LLM deobfuscation.
    """
    print("[*] Scanning for obfuscation primitives...")
    sinks = [
        "Ljava/lang/reflect/Method;->invoke",
        "Ljavax/crypto/Cipher;->doFinal",
        "Landroid/util/Base64;->decode"
    ]
    
    blocks = set()
    native_iocs = []
    
    # Exclude common boilerplate system/framework libraries to reduce noise
    boilerplate_prefixes = [
        "Landroidx/", "Landroid/support/", "Lcom/google/", "Lkotlin/",
        "Lcom/android/", "Ljava/", "Ljavax/", "Lorg/apache/"
    ]
    
    for sink in sinks:
        try:
            parts = sink.split(";->")
            if len(parts) == 2:
                cls_name = parts[0] + ";"
                method_name = parts[1]
                
                # Fetch calling methods
                for method_analysis in dx.find_methods(classname=cls_name, methodname=method_name):
                    for xref in method_analysis.get_xref_from():
                        caller_method = xref[1]
                        try:
                            method = caller_method.get_method()
                            class_name = method.get_class_name()
                            
                            # Filter boilerplate calls
                            if any(class_name.startswith(pref) for pref in boilerplate_prefixes):
                                continue
                                
                            instructions = [f"{ins.get_name()} {ins.get_output()}" for ins in method.get_instructions()]
                            
                            # ---- ⚡ FAST NATIVE PYTHON BASE64 DEOBFUSCATION ⚡ ----
                            for ins in instructions:
                                if "const-string" in ins:
                                    # Matches potential Base64 strings (length >= 8)
                                    match = re.search(r'const-string[^\"]*\"([A-Za-z0-9+/=]{8,})\"', ins)
                                    if match:
                                        b64_str = match.group(1)
                                        try:
                                            decoded_bytes = base64.b64decode(b64_str)
                                            decoded_str = decoded_bytes.decode('utf-8', errors='ignore').strip()
                                            
                                            # Validate if the decoded string represents an API, package path, or URL
                                            if (re.match(r'^(https?|ftp)://', decoded_str) or 
                                                re.match(r'^[a-zA-Z0-9_\.]+\.[a-zA-Z]{2,}', decoded_str) or 
                                                "->" in decoded_str):
                                                print(f"      [⚡ NATIVE RECOVERY] Decoded Base64 IOC -> '{decoded_str}'")
                                                native_iocs.append(decoded_str)
                                        except Exception:
                                            pass
                            
                            source = "\n".join(instructions)
                            if source:
                                blocks.add(source)
                        except Exception:
                            pass
        except Exception as e:
            print(f"[-] Error parsing sink {sink}: {e}")

    unique_blocks = list(blocks)
    print(f"[+] Scanned methods: {len(unique_blocks)} high-signal blocks recovered.")
    print(f"[+] Native Heuristics instantly cracked {len(native_iocs)} Base64 IOCs.")
    
    return unique_blocks, native_iocs

def query_local_coder(basic_block):
    """
    Executes a zero-shot inference query against local qwen2.5-coder to deobfuscate block.
    No timeouts are applied, allowing local system as much time as required to trace blocks.
    """
    prompt = f"""You are an expert reverse engineer. Perform static symbolic execution to trace variables and defeat the obfuscation in the following basic block.
Output ONLY a JSON object with the key "recovered_ioc" and the plaintext string value representing the deobfuscated API or URL. Do not output any markdown formatting, just the raw JSON.

Basic Block:
{basic_block}"""

    url = "http://localhost:11434/api/generate"
    payload = {
        "model": "qwen2.5-coder",
        "prompt": prompt,
        "format": "json",
        "stream": False
    }

    try:
        response = requests.post(url, json=payload, timeout=None)
        response.raise_for_status()
        data = response.json()
        result = json.loads(data.get("response", "{}"))
        return result.get("recovered_ioc")
    except Exception as e:
        print(f"[-] query_local_coder failed: {e}")
    
    return None
