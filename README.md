# Yawcam Ai
Yawcam Ai is a free video surveillance software for security cameras and webcams. This powerful NVR software is easy to 
use and can be installed on both Windows and Linux or run in a Docker container. 

Yawcam Ai uses advanced machine learning and Ai algorithms to detect and recognize objects, people, and vehicles in 
real-time video streams.

### Releases
Download the latest release here:  
* [yawcam-ai-windows-x64.zip](https://github.com/yawcam/yawcam-ai/releases/latest/download/yawcam-ai-windows-x64.zip)  
* [yawcam-ai-linux-x64.zip](https://github.com/yawcam/yawcam-ai/releases/latest/download/yawcam-ai-linux-x64.zip)  
* [yawcam-ai-linux-aarch64.zip](https://github.com/yawcam/yawcam-ai/releases/latest/download/yawcam-ai-linux-aarch64.zip)  

View older and beta releases here:  
https://github.com/yawcam/yawcam-ai/releases

### Container deployment
Yawcam Ai can also be run in a Docker container. There are pre-built container images available on Docker Hub and example 
docker-compose configuration files in this repo to get you started quickly.

Images:
- `yawcam/yawcam-ai` - Detection with CPU only.
- `yawcam/yawcam-ai-cuda` - Detection with Nvidia GPU using CUDA.
- `yawcam/yawcam-ai-full` - All models and CUDA libs included.

See [docker/README.md](docker/README.md) for more info on how to use the container images.


### Documentation
More info and documentation at www.yawcam.com/ai
