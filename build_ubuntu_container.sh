#!/bin/bash

printf 'User password: '
read PASSWORD

# This permits the root user on the local machine to connect to X windows display
xhost +local:docker

# remove old container and build new one
docker rm ubuntu_container
docker rmi ubuntu_container
docker build --build-arg PASSWORD=$PASSWORD -t ubuntu_container .
docker run --name=ubuntu_container -ti -e DISPLAY=$DISPLAY -v /tmp/.X11-unix:/tmp/.X11-unix -v ~/ubuntu_container_ws:/home/user ubuntu_container
# stop container
#docker stop ubuntu_container
# remove container
#docker rm ubuntu_container
# remove all images
#docker rmi -f $(docker images -a -q)
