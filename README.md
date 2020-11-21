# Simple Docker container for super lightweight desktop environment

Based on Ubuntu 20.04 image

## Startup
Build image:

`docker build . --tag docker-vnc-novnc-desktop`

Run image:

`docker run -it --rm -p 8080:8080 -v /path/to/project/:/home/vncuser/PycharmProjects/pythonProject docker-vnc-novnc-desktop`

Or run image with a different project directory path (make sure PROJECT_DIR is set to this new path):

`docker run -it --rm -p 8080:8080 -v /path/to/project/:/home/vncuser/path/to/project/ --env PROJECT_DIR=/home/vncuser/path/to/project/ docker-vnc-novnc-desktop`
