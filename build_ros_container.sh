#!/bin/bash

# This permits the root user on the local machine to connect to X windows display
xhost +local:docker

# remove old container and build new one
docker rm ros_container
docker rmi ros_container
docker build -t ros_container .
docker run --name=ros_container -ti -e DISPLAY=$DISPLAY -v /tmp/.X11-unix:/tmp/.X11-unix -v ~/catkin_ws:/home/ros/catkin_ws ros_container
