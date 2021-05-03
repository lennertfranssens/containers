# more info on http://wiki.ros.org/action/login/docker/Tutorials/Hardware%20Acceleration#nvidia-docker2
# and http://wiki.ros.org/docker/Tutorials/Docker
FROM osrf/ros:noetic-desktop-full

# fix hang on tzdata
ENV TZ=Europe/Brussels
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

# install and configure
RUN \
  apt-get -y update && \
  apt-get -y upgrade && \
  apt-get install -y apt-utils && \
  apt-get install -y sudo && \
  apt-get install -y git && \
  apt-get install -y vim && \
  apt-get install -y neovim && \
  apt-get install -y nano && \
  apt-get install -y emacs && \
  apt-get install -y wget && \
  apt-get install -y gcc && \
  apt-get install -y neofetch && \
  apt-get install -y strace && \
  apt-get install -y valgrind && \
  apt-get install -y virtualenv && \
  apt-get install -y tree && \
  DEBIAN_FRONTEND=noninteractive apt-get install -y terminator && \
  apt-get install -y firefox

RUN mkdir /home/ros

RUN echo 'root:ugr' | chpasswd
