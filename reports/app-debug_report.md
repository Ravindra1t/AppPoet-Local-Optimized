# AppPoet Malware Detection Report

**Target Application:** `app-debug.apk`  
**Package Name:** `com.browserstack.addnumber`  
**Analysis Time:** `1.64 seconds`  

## Verdict & Classification Summary

- **Verdict:** **`BENIGN`**
- **Malware Probability:** **15.20%** (`0.152`)
- **Model Confidence:** **69.60%** (`0.696`)
- **Logit Score:** `-1.7191`
- **Trailing Dot Evasion Flag:** `False`

> **Key Difference Note:**
> - **Malware Probability** estimates the likelihood that the app contains malicious behaviors.
> - **Model Confidence** measures the model's certainty/conviction in its verdict relative to the 0.5 decision boundary.

## Behavioral & Multimodal Profile

| Feature Category | Count / Value |
| :--- | :--- |
| **Recovered Permissions** | 2 (Dangerous: 2) |
| **Activities** | 1 |
| **Background Services** | 0 |
| **Broadcast Receivers** | 0 |
| **Content Providers** | 0 |
| **Intent Actions** | 1 (High-Risk: 0) |
| **Manifest Integrity** | Clean |
| **Dynamic Code Loading** | None |
| **Dropper Hidden Assets** | 0 files |
| **Native Libraries (.so)** | 0 |
| **Active Sensitive APIs** | 40 |
| **Total Sensitive Inbound Calls** | 213 |
| **FCG Execution Graph Nodes** | 13248 |
| **FCG Call Graph Edges** | 21004 |

## Top Flagged Sensitive APIs

| Method Signature | Invocation Count |
| :--- | :--- |
| `Ljava/lang/reflect/Method;->invoke` | 37 |
| `Ljava/lang/Class;->getDeclaredMethod` | 19 |
| `Ljava/lang/Class;->getDeclaredField` | 17 |
| `Ljava/lang/Class;->getMethod` | 15 |
| `Ljava/lang/reflect/Field;->setAccessible` | 14 |
| `Ljava/lang/reflect/Method;->setAccessible` | 13 |
| `Ljava/lang/reflect/Field;->get` | 12 |
| `Ljava/io/File;->delete` | 9 |

---
*Generated automatically by AppPoet Multimodal Detection Pipeline.*