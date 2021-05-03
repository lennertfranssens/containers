#!/bin/bash

docker container exec -it fedora_container /bin/bash
# stop container
#docker stop fedora_container
# remove container
#docker rm fedora_container
# remove all images
#docker rmi -f $(docker images -a -q)
