#!/bin/bash

printf 'User password: '
read PASSWORD

# This permits the root user on the local machine to connect to X windows display
xhost +local:docker

# remove old container and build new one
docker rm building_container
docker rmi building_container
docker build --build-arg PASSWORD=$PASSWORD -t building_container .
docker run --name=building_container -ti -e DISPLAY=$DISPLAY -v /tmp/.X11-unix:/tmp/.X11-unix -v ~/Documents/Android:/home/user/Android building_container
# stop container
#docker stop building_container
# remove container
#docker rm building_container
# remove all images
#docker rmi -f $(docker images -a -q)
