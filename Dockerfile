FROM ubuntu:20.04

ARG PASSWORD

SHELL ["/bin/bash", "-c"]

USER root

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
  git config --global credential.helper store && \
  DEBIAN_FRONTEND=noninteractive apt-get install -y vim neovim nano emacs wget gcc neofetch strace valgrind virtualenv tree firefox  && \
  DEBIAN_FRONTEND=noninteractive apt-get install -y bc bison build-essential ccache curl flex g++-multilib gcc-multilib git gnupg gperf imagemagick lib32ncurses5-dev lib32readline-dev lib32z1-dev liblz4-tool libncurses5 libncurses5-dev libsdl1.2-dev libssl-dev libxml2 libxml2-utils lzop pngcrush rsync schedtool squashfs-tools xsltproc zip zlib1g-dev libwxgtk3.0-gtk3-dev

# change root password
RUN echo "root:$PASSWORD" | chpasswd

# change working directory
RUN mkdir /home/user
WORKDIR /home/user


