#!/bin/bash

# This permits the root user on the local machine to connect to X windows display
xhost +local:docker

docker run --name=building_container -ti -e DISPLAY=$DISPLAY -v /tmp/.X11-unix:/tmp/.X11-unix -v ~/Documents/Android:/home/user/Android building_container
# stop container
#docker stop building_container
# remove container
#docker rm building_container
# remove all images
#docker rmi -f $(docker images -a -q)
