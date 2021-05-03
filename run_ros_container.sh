#!/bin/bash

# This permits the root user on the local machine to connect to X windows display
xhost +local:docker

# run container with ros_container image
docker run --name=ros_container -ti -e DISPLAY=$DISPLAY -v /tmp/.X11-unix:/tmp/.X11-unix -v ~/catkin_ws:/home/ros/catkin_ws ros_container

