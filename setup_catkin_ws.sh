#!/bin/bash

printf 'Git email: '
read GIT_EMAIL
printf 'Git username: '
read GIT_USERNAME
printf 'Git password: '
read GIT_PASSWORD

# setup git
git config --global credential.helper store
git config --global user.email $GIT_EMAIL
git config --global user.name $GIT_USERNAME
# setup catkin_ws
cd /home/ros
mkdir -p /home/ros/catkin_ws/src
source ros_entrypoint.sh
cd /home/ros/catkin_ws/
catkin_make -DPYTHON_EXECUTABLE=/usr/bin/python3
# enable virtualenv
virtualenv -p python3 devel/env/python3
source /home/ros/catkin_ws/devel/env/python3/bin/activate
# adding git repo in src folder
cd /home/ros/catkin_ws/src
git init
git add .
git commit -m "Init commit"
# do here a clone of your favorite UGR repo
git remote add origin https://$GIT_USERNAME:$GIT_PASSWORD@github.com/UgentRacing/mapping.git
git pull
git checkout rviz
# clean and make workspace
cd /home/ros/catkin_ws
catkin_make clean
catkin_make
# install some dependencies
pip3 install pyaml
pip3 install rospkg
pip3 install numpy
pip3 install matplotlib
pip3 install scipy
# change directory
cd /home/ros/catkin_ws
