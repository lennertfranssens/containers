#!/bin/bash

docker container exec -it building_container /bin/bash
# stop container
#docker stop building_container
# remove container
#docker rm building_container
# remove all images
#docker rmi -f $(docker images -a -q)
