#!/bin/bash

# stop container
docker stop ubuntu_container
# remove container
docker rm ubuntu_container
# remove container image
docker rmi ubuntu_container
