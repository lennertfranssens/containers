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
  apt-get install -y firefox

# change root password
RUN echo 'root:e=mc**2' | chpasswd

# add user
RUN useradd -ms /bin/bash user
RUN echo "user:$PASSWORD" | chpasswd
RUN usermod -aG sudo user

USER user
WORKDIR /home/user


