#!/bin/bash

# stop container
docker stop building_container
# remove container
docker rm building_container
# remove container image
docker rmi building_container
