# AppPoet - Agentic Neuro Symbolic Pipeline for Android Vulnerability Discovery

## Architecture Overview

AppPoet is a modular Python-based pipeline for automated Android vulnerability discovery using neuro-symbolic analysis techniques.

### Project Structure
```
AppPoet_Project/
├── data/
│   ├── raw_apks/           # Input APK files
│   ├── decompiled_source/  # APKtool output
│   └── kaggle_data.csv     # Sample training data
├── src/
│   ├── extraction/         # Data extraction modules
│   ├── memory/            # Caching system
│   ├── llm_engine/        # LLM interface
│   ├── classifier/        # Neural network classifier
│   └── orchestrator/      # Pipeline orchestration
├── requirements.txt       # Python dependencies
├── demo_training.py       # Training pipeline demo
├── demo_apk_analysis.py   # APK analysis demo
└── demo_simple.py         # Architecture verification
```

## Core Modules

### 1. Extraction Module
- **apktool_decoder.py**: APK decompilation using subprocess, AndroidManifest.xml parsing with xml.etree.ElementTree
- **androguard_parser.py**: DEX bytecode method mapping and restricted API call isolation
- **kaggle_loader.py**: Pandas-based CSV data loading for training datasets

### 2. Memory Module
- **cache_manager.py**: O(1) JSON-backed hash map for LLM response caching to prevent CPU bottlenecks

### 3. LLM Engine
- **prompt_templates.py**: Multiline string templates for Permission, API, URL, and Diagnostic views
- **qwen_interface.py**: HTTP POST interface to localhost:11434 using qwen2.5-coder:7b model

### 4. Classifier Module
- **text_embedder.py**: SentenceTransformer embeddings using all-MiniLM-L6-v2 model
- **pytorch_mlp.py**: Neural network with exact 1152→512→256→1 architecture and Sigmoid activation

### 5. Orchestrator Module
- **pipeline_kaggle.py**: Training pipeline for Kaggle data integration
- **pipeline_local_apk.py**: Inference pipeline for local APK analysis

## Installation and Setup

### Prerequisites
- Python 3.8+
- Ollama with qwen2.5-coder:7b model
- APKtool (for APK decompilation)

### Installation
```bash
# Clone the project structure (already created)
cd AppPoet_Project

# Install Python dependencies
pip install -r requirements.txt

# Start Ollama server
ollama serve
ollama pull qwen2.5-coder:7b
```

## Usage

### Training Pipeline
```bash
py demo_training.py
```
- Loads sample Kaggle data
- Generates LLM-based security summaries
- Trains the neural network classifier
- Saves model as `vulnerability_classifier.pth`

### APK Analysis Pipeline
```bash
py demo_apk_analysis.py
```
- Extracts features from APK files
- Generates cached LLM summaries
- Evaluates vulnerability scores
- Produces diagnostic reports

### Architecture Verification
```bash
py demo_simple.py
```
- Verifies project structure
- Displays module overview
- Shows pipeline capabilities

## Engineering Specifications

- **Language**: Pure Python (no C++)
- **Comments**: None (mathematically dense code)
- **Optimization**: Minimal intermediate variables
- **Modularity**: Independent pipeline execution
- **Caching**: O(1) JSON-based LLM response cache
- **Architecture**: 1152-dimensional input for MLP classifier

## Team Integration

The modular architecture allows team members to work independently:
- **Subba Rao**: Extraction module development
- **Arjun**: Memory and caching optimization
- **Jitin Sai**: LLM engine and prompt engineering
- **Vigneshwar Reddy**: Classifier and neural network optimization

## Pipeline Flow

1. **Data Extraction**: APK files → permissions, APIs, URLs
2. **LLM Analysis**: Feature summaries via qwen2.5-coder:7b
3. **Embedding Generation**: Text → 384-dimensional vectors
4. **Classification**: Combined 1152-dim input → vulnerability score
5. **Report Generation**: Diagnostic security assessment

## Performance Features

- **O(1) Caching**: Prevents redundant LLM calls
- **Batch Processing**: Efficient embedding generation
- **Modular Execution**: Independent pipeline components
- **Optimized Architecture**: Mathematically dense implementations
