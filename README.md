# ros_container Docker image for Linux
This repo provides some commands to use a Docker image that uses Ubuntu (20.04 LTS) and adds ROS noetic to the installation. Applications that use a GUI like rviz are redirected to the host OS display with X11.

This is a sideproject of the [UGhent Racing Team](https://github.com/UgentRacing). The main goal is to mainstream the installation and setup of ROS. As a positive side effect, this method of using ROS allows you to install and run ROS on each Linux distro.

![Running rviz on the ros_container in a window of the host OS](https://i.imgur.com/8nvUaMu.png)
*Running rviz on the ros_container in a window of the host OS*

# Usage
## Credentials
Use your own git credentials. The user on the OS has username ```root``` with password ```ugr```.

## Commands
```bash
# build the docker image
bash ./build_ros_container.sh
# stop container
bash ./stop_ros_container.sh
# run container
bash ./run_ros_container.sh
# start interactive container
bash ./start_interactive_ros_container.sh
# start container
bash ./start_ros_container.sh
# open (connect to) shell session of running container
bash ./connect_ros_container.sh
# clean container files
bash ./cleanup_ros_container.sh
# remove all Docker images
bash ./remove_all_docker_images.sh
```

# Developing on container
## VSCode
1. Install Visual Studio Code on your host distro by using snap.
```bash
sudo snap install code --classic
```

2. Install needed and essential extensions for Visual Studio Code.
```bash
code --install-extension ms-azuretools.vscode-docker
code --install-extension ms-vscode-remote.remote-containers
code --install-extension ms-vscode-remote.remote-ssh
code --install-extension ms-vsliveshare.vsliveshare
code --install-extension gruntfuggly.todo-tree
code --install-extension enkia.tokyo-night
```

3. Connect and disconnect to the container in Visual Studio Code.
   1. Open Visual Studio Code and open the *Remote Explorer* tab. Right click on ```ros_container``` in the *Other Containers* or *Dev Containers* menu. Select the option *Attach to Container*.
   2. A new window opens and you are connected to the ```ros_container```. 
   3. Open the *Explorer* tab and click on the button *Open Folder* to navigate to the /home/ros/catkin_ws directory.
   4. To close the connection, click on the button *Editing on Container ros_container (/ros_container)* on the lower left corner of the window.
   5. Select the option *Close Remote Connection* from the menu.
   6. Close Visual Studio Code.

## Use your favorite CLI editor
This Docker image includes the following CLI editors:
* vim
* neovim
* nano
* emacs

# Installation
First make the Docker image.
```bash
bash ./build_ros_container.sh
```

When the container is started, it will share a folder with the host OS (mounted on the host under ~/catkin_ws). This folder is used as persistent storage and is also your catkin_ws folder. To init this folder run the setup_catkin_ws.sh script on the first run of the ros_container.
```bash
git clone https://github.com/lennertfranssens/containers.git /home/ros/ros_container
cd /home/ros/ros_container
git checkout ros
bash ./setup_catkin_ws.sh # clones mapping repo and does a checkout to the rviz branch to test GUI redirect
```

You do not need to pull the git repo after you ran the previous script on the first run. Also the most common pip dependencies are permanently installed. From now you only need to start the virtualenv after the container was stopped.
```bash
source /home/ros/catkin_ws/devel/env/python3/bin/activate
cd /home/ros/catkin_ws/
catkin_make
source devel/setup.bash
# example to let rviz run
roslaunch exploration startExploring.launch &
roslaunch map_odom_publisher odometryPublisher.launch &
roslaunch map_odom_publisher mapPublisher.launch &
rviz & # open config file in /home/catkin_ws/src/mapping/rviz_config/rtt_viz.rviz
```

### More information
Visit: 
* http://wiki.ros.org/action/login/docker/Tutorials/Hardware%20Acceleration#nvidia-docker2
* http://wiki.ros.org/docker/Tutorials/Docker
* https://hub.docker.com/_/ros

### Using this project on Docker for Windows?
If you use this project on Docker for Windows, the window redirection is not working. Please visit [this website](https://dev.to/darksmile92/run-gui-app-in-linux-docker-container-on-windows-host-4kde) for more information to get it working.
