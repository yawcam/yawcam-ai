# Building Yawcam Ai container images
This repo contains Dockerfiles and related resources for building Yawcam Ai container images.

## Available Dockerfiles
All Dockerfiles handle multi-platform builds with buildx and can produce images for the architectures `linux/amd64` and `linux/arm64`.

- `yawcam-ai/`[Dockerfile](./yawcam-ai/Dockerfile): Builds a Yawcam Ai image. (Detection with CPU only, no GPU support.)
- `yawcam-ai-cuda/`[Dockerfile](./yawcam-ai-cuda/Dockerfile): Builds a Yawcam Ai image with CUDA support for NVIDIA GPUs.
- `yawcam-ai-full/`[Dockerfile](./yawcam-ai-full/Dockerfile): Builds a Yawcam Ai image with all models and CUDA libs included. No downloads required during initial setup.

## Building locally with buildx
To build the images locally using Docker buildx, follow these steps:

1) Only needed once: Prepare a buildx builder that supports multi-platform builds and cross-architecture emulation. 
    You can do this by running the following commands in your terminal:
    ```bash
    # create and switch to a docker-container builder (uses proper emulation)
    docker buildx create --name mybuilder --driver docker-container --use
    
    # bootstrap builder (starts containers)
    docker buildx inspect --bootstrap
    
    # register QEMU binfmt handlers for cross-arch emulation (required once)
    docker run --privileged --rm tonistiigi/binfmt --install all
    
    # optionally verify binfmt entries
    docker run --rm --privileged multiarch/qemu-user-static --reset -p yes
    ```

2) Run the buildx build command to build and push the desired image:
    ```bash
    export TAG="latest"                 # set desired image tag
    export YAWCAM_VERSION="1.7.0"       # set desired Yawcam Ai version
    export DOCKER_USER="<docker-user>"  # set your Docker Hub username
    docker buildx build \
      --build-arg YAWCAM_VERSION=${YAWCAM_VERSION} \
      --platform linux/amd64,linux/arm64 \
      --tag ${DOCKER_USER}/yawcam-ai:${TAG} \
      --tag ${DOCKER_USER}/yawcam-ai:${YAWCAM_VERSION} \
      -f ./yawcam-ai/Dockerfile . --push
    ```
   Alternatively, you can build for a single platform and store the image locally without pushing it to Docker Hub:
    ```bash
    docker buildx build \
      --build-arg YAWCAM_VERSION=${YAWCAM_VERSION} \
      --platform linux/amd64 \
      --tag yawcam-ai:${TAG} \
      --tag yawcam-ai:${YAWCAM_VERSION} \
      -f ./yawcam-ai/Dockerfile . --load
    ```

## Building with GitHub Workflows
You can also set up GitHub Actions workflows to automate the building and publishing of the images. Please refer to the 
workflow [build-docker-images.yaml](../.github/workflows/build-docker-images.yaml) that is used in this repository to 
push official images to Docker Hub.
