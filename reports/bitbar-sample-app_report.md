# AppPoet Malware Detection Report

**Target Application:** `bitbar-sample-app.apk`  
**Package Name:** `com.bitbar.testdroid`  
**Analysis Time:** `0.1 seconds`  

## Verdict & Classification Summary

- **Verdict:** **`MALICIOUS`**
- **Malware Probability:** **57.65%** (`0.5765`)
- **Model Confidence:** **15.30%** (`0.153`)
- **Logit Score:** `0.3085`
- **Trailing Dot Evasion Flag:** `False`

> **Key Difference Note:**
> - **Malware Probability** estimates the likelihood that the app contains malicious behaviors.
> - **Model Confidence** measures the model's certainty/conviction in its verdict relative to the 0.5 decision boundary.

## Behavioral & Multimodal Profile

| Feature Category | Count / Value |
| :--- | :--- |
| **Recovered Permissions** | 2 (Dangerous: 1) |
| **Activities** | 3 |
| **Background Services** | 0 |
| **Broadcast Receivers** | 0 |
| **Content Providers** | 0 |
| **Intent Actions** | 1 (High-Risk: 0) |
| **Manifest Integrity** | Clean |
| **Dynamic Code Loading** | None |
| **Dropper Hidden Assets** | 0 files |
| **Native Libraries (.so)** | 0 |
| **Active Sensitive APIs** | 0 |
| **Total Sensitive Inbound Calls** | 0 |
| **FCG Execution Graph Nodes** | 50 |
| **FCG Call Graph Edges** | 51 |

## Top Flagged Sensitive APIs

| Method Signature | Invocation Count |
| :--- | :--- |

---
*Generated automatically by AppPoet Multimodal Detection Pipeline.*