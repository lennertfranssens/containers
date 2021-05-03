#!/bin/bash

docker run --name=ubuntu_container -ti -e DISPLAY=$DISPLAY -v /tmp/.X11-unix:/tmp/.X11-unix -v ~/catkin_ws:/home/ros/catkin_ws ubuntu_container
# stop container
#docker stop ubuntu_container
# remove container
#docker rm ubuntu_container
# remove all images
#docker rmi -f $(docker images -a -q)
