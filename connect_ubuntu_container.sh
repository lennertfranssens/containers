#!/bin/bash

docker container exec -it ubuntu_container /bin/bash
# stop container
#docker stop ubuntu_container
# remove container
#docker rm ubuntu_container
# remove all images
#docker rmi -f $(docker images -a -q)
