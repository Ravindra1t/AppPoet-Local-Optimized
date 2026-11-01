# Production-ready Dockerfile for Android APK feature extraction & inference pipeline
FROM python:3.11-slim

# Avoid prompts from debian frontend
ENV DEBIAN_FRONTEND=noninteractive
ENV PYTHONUNBUFFERED=1

# Install OpenJDK, wget, unzip, git, and required build tools
RUN apt-get update && apt-get install -y --no-install-recommends \
    openjdk-17-jre-headless \
    wget \
    unzip \
    git \
    && rm -rf /var/lib/apt/lists/*

# Install JADX CLI for deobfuscation
ENV JADX_VERSION=1.5.0
RUN wget -q "https://github.com/skylot/jadx/releases/download/v${JADX_VERSION}/jadx-${JADX_VERSION}.zip" -O /tmp/jadx.zip && \
    mkdir -p /opt/jadx && \
    unzip -q /tmp/jadx.zip -d /opt/jadx && \
    rm /tmp/jadx.zip && \
    ln -s /opt/jadx/bin/jadx /usr/local/bin/jadx

# Install Apktool
ENV APKTOOL_VERSION=2.9.3
RUN wget -q "https://bitbucket.org/iBotPeaches/apktool/downloads/apktool_${APKTOOL_VERSION}.jar" -O /usr/local/bin/apktool.jar && \
    wget -q "https://raw.githubusercontent.com/iBotPeaches/apktool/master/scripts/linux/apktool" -O /usr/local/bin/apktool && \
    chmod +x /usr/local/bin/apktool /usr/local/bin/apktool.jar

WORKDIR /app

# Install Python requirements
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Copy source code
COPY . .

# Default entrypoint for testing
ENTRYPOINT ["python", "apk_extractor.py"]
CMD ["--help"]
