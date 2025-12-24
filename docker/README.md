# Docker images for Yawcam Ai
Yawcam Ai is available on [Docker Hub](https://hub.docker.com/u/yawcam) for easy deployment.  
The following images are provided:

| Image                   | Description                                                                                 |
|-------------------------|---------------------------------------------------------------------------------------------|
| `yawcam/yawcam-ai`      | Detection with CPU only.                                                                    |
| `yawcam/yawcam-ai-cuda` | Detection with Nvidia GPU using CUDA.<br/>(Graceful fallback to CPU if no GPU is available) |
| `yawcam/yawcam-ai-full` | All models and CUDA libs included.<br/>No downloads required during initial setup.          |

# Architecture
All images support multiple architectures, including `linux/amd64` and `linux/arm64`.
This allows you to run the images on a variety of platforms, such as x86_64 based PCs, servers, NAS devices or NUCs
and ARM-based devices like Raspberry Pi.

If you are running Docker on a Windows host, please make sure to run Docker inside WSL2.
See the [Windows considerations](#windows-considerations) section below for more info.

# Tags
The images are tagged with version number and `latest` or `edge` tags:

| Tag            | Description                          |
|----------------|--------------------------------------|
| `latest`       | Latest stable release                |
| `edge`         | Most recent release (Stable OR Beta) |
| `1.7.0`        | Specific version (example)           |
| `1.8.0-beta.2` | Specific version (example)           |

Please note that the `edge` tag will always point to the most recent version, regardless if that version is stable or beta.
So choose the `edge` tag if you always want the newest features and improvements as soon as they are available.

Choose the `latest` tag if you prefer a more stable experience. The example docker compose files use the
`latest` tag by default.

# Running `yawcam-ai` with Docker Compose
Use this image to run Yawcam Ai with detection on CPU only. View/modify the example compose file [yawcam-ai/compose.yaml](./yawcam-ai/compose.yaml) 
before running:
```bash
docker pull yawcam/yawcam-ai:latest
docker compose -f ./yawcam-ai/compose.yaml up -d
```
Open the Yawcam Ai web interface in your browser at `http://localhost:5995` (or replace `localhost` with the IP address 
or hostname of your Docker host).

# Running `yawcam-ai-cuda` with Docker Compose
Use this image to run Yawcam Ai with detection using an Nvidia GPU with CUDA support. View/modify the example compose file 
[yawcam-ai-cuda/compose.yaml](./yawcam-ai-cuda/compose.yaml) before running:
```bash
docker pull yawcam/yawcam-ai-cuda:latest
docker compose -f ./yawcam-ai-cuda/compose.yaml up -d
```
Open the Yawcam Ai web interface in your browser at `http://localhost:5995` (or replace `localhost` with the IP address 
or hostname of your Docker host).

# Running `yawcam-ai-full` with Docker Compose
Use this image to run Yawcam Ai with all models and CUDA libraries included. This image does not require any downloads 
during the initial setup. View/modify the example compose file [yawcam-ai-full/compose.yaml](./yawcam-ai-full/compose.yaml) 
before running:
```bash
docker pull yawcam/yawcam-ai-full:latest
docker compose -f ./yawcam-ai-full/compose.yaml up -d
```
Open the Yawcam Ai web interface in your browser at `http://localhost:5995` (or replace `localhost` with the IP address 
or hostname of your Docker host).

# Windows considerations
When running the Yawcam Ai Docker containers on a Windows host, Yawcam Ai will not work as expected when mounting volumes
from the Windows file system. This is due to limitations in how Docker interacts with the Windows file system when running 
Linux containers.

Therefore, it is recommended to run Docker inside WSL2 on Windows hosts, and store the mounted volumes inside the WSL2 
file system. Running Yawcam Ai in this way works as expected.

# Community contributed images
There are some community contributed Docker images available. These images are not officially maintained by the 
Yawcam Ai project, but they may offer additional features or platforms:

- [855princekumar/yawcam-ai-dockerized](https://github.com/855princekumar/yawcam-ai-dockerized) - A community maintained image for Yawcam Ai. (Supports experimental Alpine Linux base image)

# Building your own images
If you want to build your own Docker images for Yawcam Ai, please refer to the [BUILD.md](./BUILD.md) file.   