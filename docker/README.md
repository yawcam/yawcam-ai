# Docker images for Yawcam Ai
There are pre-built container images available on [Docker Hub](https://hub.docker.com/u/yawcam) for easy deployment of 
Yawcam Ai.

The following images are provided:
- `yawcam/yawcam-ai` - Detection with CPU only.
- `yawcam/yawcam-ai-cuda` - Detection with Nvidia GPU using CUDA. (Graceful fallback to CPU if no GPU is available)

All images support multiple architectures, including `linux/amd64` and `linux/arm64`.
This allows you to run the images on a variety of platforms, such as x86_64 based PCs, servers, NAS devices or NUCs 
and ARM-based devices like Raspberry Pi. 

## Tags
The images are tagged with version numbers and `latest` or `beta` tags for stable and beta releases, respectively.
For example:
- `yawcam/yawcam-ai:latest` - Latest stable release
- `yawcam/yawcam-ai:beta` - Latest beta release
- `yawcam/yawcam-ai:1.7.0` - Specific version

Please note that the `beta` tag will always point to the most recent version, even if that version is the current stable 
release. So choose the `beta` tag if you always want the newest features and improvements as soon as they are available. 

Choose the `latest` tag if you prefer a more stable experience. The example docker compose files in this repo uses the 
`latest` tag by default.

## Running `yawcam-ai` with Docker Compose
Use this image to run Yawcam Ai with detection on CPU only. View/modify the [example compose file](./yawcam-ai/compose.yaml) 
before running:
```bash
docker pull yawcam/yawcam-ai:latest
docker compose -f ./yawcam-ai/compose.yaml up -d
```
Open the Yawcam Ai web interface in your browser at `http://localhost:5995` (or replace `localhost` with the IP address 
or hostname of your Docker host).

## Running `yawcam-ai-cuda` with Docker Compose
Use this image to run Yawcam Ai with detection using an Nvidia GPU with CUDA support. View/modify the 
[example compose file](./yawcam-ai-cuda/compose.yaml) before running:
```bash
docker pull yawcam/yawcam-ai-cuda:latest
docker compose -f ./yawcam-ai-cuda/compose.yaml up -d
```
Open the Yawcam Ai web interface in your browser at `http://localhost:5995` (or replace `localhost` with the IP address 
or hostname of your Docker host).

## Running Yawcam Ai with Portainer
You can also use [Portainer](https://www.portainer.io/) to deploy and manage the Yawcam Ai Docker containers.
1. Open Portainer in your web browser and log in.
2. Navigate to the "Stacks" section in the left sidebar.
3. Click on the "Add stack" button.
4. Enter a name for your stack, e.g., `yawcam-ai`.
5. Copy the contents of the desired example compose file ([yawcam-ai/compose.yaml](./yawcam-ai/compose.yaml) or 
[yawcam-ai-cuda/compose.yaml](./yawcam-ai-cuda/compose.yaml)) into the "Web editor" section.
6. Click on the "Deploy the stack" button to create and start the container.
7. Open the Yawcam Ai web interface in your browser at `http://<your-portainer-host>:5995`, replacing `<your-portainer-host>` with the IP address or hostname of your Portainer host.
8. Done!

## Windows considerations
When running the Yawcam Ai Docker containers on a Windows host, Yawcam Ai will not work as expected when mounting volumes
from the Windows file system. This is due to limitations in how Docker interacts with the Windows file system when running 
Linux containers.

Therefore, it is recommended to run Docker inside WSL2 on Windows hosts, and store the mounted volumes inside the WSL2 
file system. Running Yawcam Ai in this way works as expected.

## Community contributed images
There are some community contributed Docker images available. These images are not officially maintained by the 
Yawcam Ai project, but they may offer additional features or platforms:

- [855princekumar/yawcam-ai-dockerized](https://github.com/855princekumar/yawcam-ai-dockerized) - A community maintained image for Yawcam Ai. (Supports experimental Alpine Linux base image)

## Building your own images
If you want to build your own Docker images for Yawcam Ai, please refer to the [BUILD.md](./BUILD.md) file.   