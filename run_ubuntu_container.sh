#!/bin/bash

# This permits the root user on the local machine to connect to X windows display
xhost +local:docker

docker run --name=ubuntu_container -ti -e DISPLAY=$DISPLAY -v /tmp/.X11-unix:/tmp/.X11-unix -v ~/ubuntu_container_home:/home/user ubuntu_container
# stop container
#docker stop ubuntu_container
# remove container
#docker rm ubuntu_container
# remove all images
#docker rmi -f $(docker images -a -q)
