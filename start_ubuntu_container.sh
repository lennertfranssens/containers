#!/bin/bash

# This permits the root user on the local machine to connect to X windows display
xhost +local:docker

docker start ubuntu_container
# stop container
#docker stop ubuntu_container
# remove container
#docker rm ubuntu_container
# remove all images
#docker rmi -f $(docker images -a -q)
