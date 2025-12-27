# Use Ubuntu LTS as the base image
FROM nvidia/cuda:12.9.1-base-ubuntu24.04

# Define the argument that Docker Buildx passes automatically
ARG TARGETARCH

# Define the build argument with a default value of "latest"
ARG YAWCAM_VERSION="latest"

# Install necessary tools and dependencies
# We also install ca-certificates to ensure SSL downloads work
RUN apt-get update && apt-get install -y --no-install-recommends \
    alsa-utils \
    ca-certificates \
    curl \
    libasound2-dev \
    libgtk2.0-0 \
    libpulse0 \
    libva-drm2 \
    libx11-6 \
    libxtst6 \
    tzdata \
    unzip \
    v4l-utils \
    && rm -rf /var/lib/apt/lists/*

# Download the correct file based on architecture and version
RUN echo "Building version $YAWCAM_VERSION for architecture: $TARGETARCH" && \
    if [ "$YAWCAM_VERSION" = "latest" ]; then \
      DOWNLOAD_URL="https://github.com/yawcam/yawcam-ai/releases/${YAWCAM_VERSION}/download"; \
    else \
      DOWNLOAD_URL="https://github.com/yawcam/yawcam-ai/releases/download/${YAWCAM_VERSION}"; \
    fi && \
    if [ "$TARGETARCH" = "amd64" ]; then \
        DOWNLOAD_URL="${DOWNLOAD_URL}/yawcam-ai-linux-x64.zip"; \
    elif [ "$TARGETARCH" = "arm64" ]; then \
        DOWNLOAD_URL="${DOWNLOAD_URL}/yawcam-ai-linux-aarch64.zip"; \
    else \
        echo "Unsupported architecture: $TARGETARCH" && exit 1; \
    fi && \
    # Download to /tmp and unzip \
    curl -L -o /tmp/yawcam-ai.zip "$DOWNLOAD_URL" && \
    unzip /tmp/yawcam-ai.zip -d /opt && \
    # Cleanup \
    rm -rf /tmp/yawcam-ai.zip && \
    # Add file to enable container mode \
    echo -n "" > /opt/yawcam-ai/.container-mode && \
    # Ensure the script is executable \
    chmod +x /opt/yawcam-ai/YawcamAi.sh && \
    chmod +x /opt/yawcam-ai/YawcamAi-console.sh

# Set the working directory
WORKDIR /opt/yawcam-ai

# Expose web UI port
EXPOSE 5995

# Use the console mode as the entrypoint
ENTRYPOINT ["./YawcamAi-console.sh"]