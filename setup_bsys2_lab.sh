#!/bin/bash

printf 'GIT email: '
read GIT_EMAIL
printf 'GIT username: '
read GIT_USERNAME
printf 'GIT password: '
read GIT_PASSWORD

# configure git credentials
git config --global user.name $GIT_USERNAME
git config --global user.email $GIT_EMAIL

# download os lab
mkdir -p /home/user/bsys2
git clone https://$GIT_USERNAME:$GIT_PASSWORD@github.ugent.be/lefranss-besturingssystemen2/lab.git /home/user/bsys2/lab
