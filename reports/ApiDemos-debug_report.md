# AppPoet Malware Detection Report

**Target Application:** `ApiDemos-debug.apk`  
**Package Name:** `io.appium.android.apis`  
**Analysis Time:** `2.41 seconds`  

## Verdict & Classification Summary

- **Verdict:** **`BENIGN`**
- **Malware Probability:** **21.29%** (`0.2129`)
- **Model Confidence:** **57.43%** (`0.5743`)
- **Logit Score:** `-1.3078`

> **Key Difference Note:**
> - **Malware Probability** estimates the likelihood that the app contains malicious behaviors.
> - **Model Confidence** measures the model's certainty/conviction in its verdict relative to the 0.5 decision boundary.

## Behavioral & Multimodal Profile

| Feature Category | Count / Value |
| :--- | :--- |
| **Declared Permissions** | 12 |
| **Background Services** | 11 |
| **Broadcast Receivers** | 7 |
| **Active Sensitive APIs** | 58 |
| **Total Sensitive Inbound Calls** | 393 |
| **FCG Execution Graph Nodes** | 19906 |
| **FCG Call Graph Edges** | 36349 |

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