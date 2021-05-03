#!/bin/bash

# stop container
docker stop fedora_container
# remove container
docker rm fedora_container
# remove container image
docker rmi fedora_container
