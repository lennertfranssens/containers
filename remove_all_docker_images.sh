#!/bin/bash

# remove all images
docker rmi -f $(docker images -a -q)
