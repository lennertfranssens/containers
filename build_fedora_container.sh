#!/bin/bash

docker rm fedora_container
docker rmi fedora_container
docker build --build-arg PASSWORD=$PASSWORD -t fedora_container .
docker run --name=fedora_container -ti -e DISPLAY=$DISPLAY -v /tmp/.X11-unix:/tmp/.X11-unix -v ~/fedora_container_ws:/home/user fedora_container
# stop container
#docker stop fedora_container
# remove container
#docker rm fedora_container
# remove all images
#docker rmi -f $(docker images -a -q)
