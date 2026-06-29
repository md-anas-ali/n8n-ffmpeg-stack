# Official n8n image
FROM n8nio/n8n:latest

# Switch to root
USER root

# Install packages
RUN apk update && \
    apk add --no-cache \
      ffmpeg \
      docker-cli \
      python3 \
      py3-pip \
      curl \
      bash && \
    python3 -m pip install --upgrade pip --break-system-packages && \
    python3 -m pip install edge-tts --break-system-packages && \
    addgroup -S docker || true && \
    addgroup node docker && \
    rm -rf /var/cache/apk/*

# Back to node user
USER node

EXPOSE 5678
