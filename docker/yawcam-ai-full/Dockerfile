
# Define the build argument with a default value of "latest"
ARG YAWCAM_VERSION="latest"

# Use ordinary yawcam-ai-cuda as the base image
FROM yawcam/yawcam-ai-cuda:${YAWCAM_VERSION}

# Define the argument that Docker Buildx passes automatically
ARG TARGETARCH

# Download models
ADD https://github.com/yawcam/yawcam-ai/releases/download/models/yolov4-tiny.weights /files/models/yolo-v4-tiny/
ADD https://github.com/yawcam/yawcam-ai/releases/download/models/yolov7.weights /files/models/yolo-v7/

# Download additional native libraries for CUDA support
ARG LIB_VERSION="1.5.11"
RUN LIB_DIR="/files/libs/${LIB_VERSION}" && \
    mkdir -p ${LIB_DIR} && \
    if [ "$TARGETARCH" = "amd64" ]; then \
      curl -L -o ${LIB_DIR}/cuda-12.6-9.5-1.5.11-linux-x86_64-redist.jar https://repo1.maven.org/maven2/org/bytedeco/cuda/12.6-9.5-1.5.11/cuda-12.6-9.5-1.5.11-linux-x86_64-redist.jar; \
    elif [ "$TARGETARCH" = "arm64" ]; then \
      curl -L -o ${LIB_DIR}/cuda-12.6-9.5-1.5.11-linux-arm64-redist.jar https://repo1.maven.org/maven2/org/bytedeco/cuda/12.6-9.5-1.5.11/cuda-12.6-9.5-1.5.11-linux-arm64-redist.jar; \
    else \
        echo "Unsupported architecture: $TARGETARCH" && exit 1; \
    fi

# Copy the prepare script and make it executable
COPY ./prepare-files.sh /opt/yawcam-ai/prepare-files.sh
RUN chmod +x /opt/yawcam-ai/prepare-files.sh

# Set the working directory
WORKDIR /opt/yawcam-ai

# Expose web UI port
EXPOSE 5995

# Use the console mode as the entrypoint
ENTRYPOINT ["/bin/sh", "-c", "./prepare-files.sh && exec ./YawcamAi-console.sh"]