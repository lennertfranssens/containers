#!/bin/bash

# This permits the root user on the local machine to connect to X windows display
xhost +local:docker

# start container
docker start ros_container
