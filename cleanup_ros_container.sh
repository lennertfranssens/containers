#!/bin/bash

# stop container
docker stop ros_container
# remove container
docker rm ros_container
# remove container image
docker rmi ros_container
