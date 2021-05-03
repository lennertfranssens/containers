#!/bin/bash

# This permits the root user on the local machine to connect to X windows display
xhost +local:docker

# start interactive container
docker start -i ros_container
