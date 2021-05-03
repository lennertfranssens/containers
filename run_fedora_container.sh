#!/bin/bash

docker run --name=fedora_container -ti -e DISPLAY=$DISPLAY -v /tmp/.X11-unix:/tmp/.X11-unix fedora_container
# stop container
#docker stop fedora_container
# remove container
#docker rm fedora_container
# remove all images
#docker rmi -f $(docker images -a -q)
