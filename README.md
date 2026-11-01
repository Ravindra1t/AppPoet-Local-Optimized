# Android Malware Detection Feature Extraction Pipeline

Production-ready static analysis feature extractor that takes raw `.apk` files and outputs the two required inputs for PyTorch multimodal graph neural network models:
1. **Semantic Feature Dictionary (`semantic_features.json`)**: Requested Android permissions, registered background services, broadcast receivers, and invocation counts for the top 200 sensitive Android APIs.
2. **Function Call Graph Edge List (`fcg_edges.txt`)**: Directed call graph edge list (`source target`) formatted for PyTorch Geometric (`edge_index`), DGL, or NetworkX, accompanied by node index mappings (`fcg_nodes.json`).

---

## Project Structure

```
├── apk_extractor.py               # Main APKExtractor class and CLI entrypoint
├── sensitive_apis.py              # Curated catalog of the top 200 sensitive Android APIs
├── pipeline_integration_example.py # End-to-end integration demo connecting extractor to PyTorch
├── test_extractor.py              # Unit & integration test suite
├── requirements.txt               # Python package dependencies
├── Dockerfile                     # Production Linux container with JADX, Apktool, & Python 3.11
└── README.md                      # Documentation & usage guide
```

---

## Installation & Setup

### Option 1: Local Environment

```bash
pip install -r requirements.txt
```

*(Optional)* For Java deobfuscation with JADX, ensure [JADX](https://github.com/skylot/jadx) is installed and available in your `PATH`.

### Option 2: Docker Container (Recommended for Production & CI/CD)

The included `Dockerfile` installs Python 3.11, OpenJDK 17, JADX CLI 1.5.0, and Apktool 2.9.3:

```bash
docker build -t apk-extractor .
docker run --rm -v $(pwd)/samples:/data apk-extractor /data/sample.apk -o /data/output
```

---

## Python API Usage

```python
from apk_extractor import APKExtractor

# Initialize extractor
extractor = APKExtractor(
    apk_path="path/to/sample.apk",
    output_dir="./output",
    verbose=True
)

# Run complete extraction
results = extractor.extract_all(
    decompile=False,           # Set to True if JADX deobfuscation is desired
    export_format="integer",   # 'integer' (0 1\n1 2) or 'signature' (raw smali)
    include_external=True      # Include Android/Java framework API call nodes
)

print(f"Features saved to: {results['features_path']}")
print(f"FCG edges saved to: {results['fcg_path']}")
print(f"Extracted {results['graph_stats']['num_nodes']} nodes and {results['graph_stats']['num_edges']} edges.")
```

---

## CLI Usage

```bash
# ==========================================
# 1. Unified End-to-End Pipeline (Recommended)
# ==========================================
# Scan APK, classify with multimodal model, and auto-save reports to ./reports:
python run_pipeline.py sample.apk

# Scan an entire directory of APKs:
python run_pipeline.py ./samples

# Run benchmark analysis on workspace APK samples:
python run_pipeline.py --benchmark

# Output raw JSON to terminal:
python run_pipeline.py sample.apk --json

# ==========================================
# 2. Standalone Feature Extraction
# ==========================================
# Standard extraction (semantic features + FCG edge list)
python apk_extractor.py sample.apk -o ./output

# Enable JADX deobfuscation
python apk_extractor.py sample.apk -o ./output --decompile --tool jadx

# Output FCG with raw method signatures instead of integer IDs
python apk_extractor.py sample.apk -o ./output --format signature
```

---

## Output Schema

### 1. `semantic_features.json`
```json
{
  "app_perm": [
    "android.permission.INTERNET",
    "android.permission.READ_PHONE_STATE",
    "android.permission.SEND_SMS"
  ],
  "services": [
    "com.malicious.payload.SyncService"
  ],
  "receivers": [
    "com.malicious.payload.BootReceiver"
  ],
  "api_calls": {
    "Landroid/telephony/SmsManager;->sendTextMessage": 3,
    "Ljava/net/URL;->openConnection": 5,
    "Ljava/lang/Runtime;->exec": 1,
    ... (200 entries)
  }
}
```

### 2. `fcg_edges.txt`
Space-separated directed edge list (`source target`):
```
0 1
0 2
1 3
2 3
```

### 3. `fcg_nodes.json`
Node index mapping file:
```json
{
  "0": "Lcom/malicious/payload/MainActivity;->onCreate(Landroid/os/Bundle;)V",
  "1": "Landroid/telephony/SmsManager;->sendTextMessage(...)V",
  "2": "Ljava/net/URL;->openConnection()Ljava/net/URLConnection;",
  "3": "Ljava/net/HttpURLConnection;->connect()V"
}
```

---

## Running Tests

Execute the unit and integration test suite:

```bash
python -m unittest test_extractor.py
```
