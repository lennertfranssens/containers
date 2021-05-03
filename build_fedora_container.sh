#!/bin/bash

printf 'Git email: '
read GIT_EMAIL
printf 'Git username: '
read GIT_USERNAME
printf 'Git password: '
read GIT_PASSWORD

docker rm fedora_container
docker rmi fedora_container
docker build --build-arg GIT_EMAIL=$GIT_EMAIL --build-arg GIT_USERNAME=$GIT_USERNAME --build-arg GIT_PASSWORD=$GIT_PASSWORD -t fedora_container .
docker run --name=fedora_container -ti -e DISPLAY=$DISPLAY -v /tmp/.X11-unix:/tmp/.X11-unix fedora_container
# stop container
#docker stop fedora_container
# remove container
#docker rm fedora_container
# remove all images
#docker rmi -f $(docker images -a -q)
