#!/bin/bash

# This permits the root user on the local machine to connect to X windows display
xhost +local:docker

docker start -i fedora_container
# stop container
#docker stop fedora_container
# remove container
#docker rm fedora_container
# remove all images
#docker rmi -f $(docker images -a -q)
