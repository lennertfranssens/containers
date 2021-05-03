#!/bin/bash

docker run --name=fedora_container -ti -e DISPLAY=$DISPLAY -v /tmp/.X11-unix:/tmp/.X11-unix -v ~/fedora_container_home:/home/user fedora_container
# stop container
#docker stop fedora_container
# remove container
#docker rm fedora_container
# remove all images
#docker rmi -f $(docker images -a -q)
