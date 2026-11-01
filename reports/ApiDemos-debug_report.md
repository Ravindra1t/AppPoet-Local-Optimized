# AppPoet Malware Detection Report

**Target Application:** `ApiDemos-debug.apk`  
**Package Name:** `io.appium.android.apis`  
**Analysis Time:** `2.75 seconds`  

## Verdict & Classification Summary

- **Verdict:** **`BENIGN`**
- **Malware Probability:** **21.83%** (`0.2183`)
- **Model Confidence:** **56.34%** (`0.5634`)
- **Logit Score:** `-1.2756`
- **Trailing Dot Evasion Flag:** `False`

> **Key Difference Note:**
> - **Malware Probability** estimates the likelihood that the app contains malicious behaviors.
> - **Model Confidence** measures the model's certainty/conviction in its verdict relative to the 0.5 decision boundary.

## Behavioral & Multimodal Profile

| Feature Category | Count / Value |
| :--- | :--- |
| **Recovered Permissions** | 18 (Dangerous: 11) |
| **Activities** | 332 |
| **Background Services** | 11 |
| **Broadcast Receivers** | 7 |
| **Content Providers** | 3 |
| **Intent Actions** | 8 (High-Risk: 2) |
| **Manifest Integrity** | Clean |
| **Dynamic Code Loading** | None |
| **Dropper Hidden Assets** | 1 files |
| **Native Libraries (.so)** | 0 |
| **Active Sensitive APIs** | 58 |
| **Total Sensitive Inbound Calls** | 393 |
| **FCG Execution Graph Nodes** | 18444 |
| **FCG Call Graph Edges** | 34957 |

## Top Flagged Sensitive APIs

| Method Signature | Invocation Count |
| :--- | :--- |
| `Ljava/lang/reflect/Method;->invoke` | 58 |
| `Ljava/lang/Class;->getDeclaredMethod` | 29 |
| `Ljava/lang/Class;->getMethod` | 25 |
| `Ljava/lang/Class;->getDeclaredField` | 23 |
| `Ljava/io/File;->delete` | 22 |
| `Ljava/lang/reflect/Field;->setAccessible` | 19 |
| `Landroid/content/ContentResolver;->query` | 19 |
| `Ljava/lang/reflect/Field;->get` | 17 |

---
*Generated automatically by AppPoet Multimodal Detection Pipeline.*