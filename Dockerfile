FROM fedora:34

ARG PASSWORD

USER root

# install and configure
RUN \
  dnf -y update && \
  dnf install -y git && \
  git config --global credential.helper store && \
  git config --global user.email $GIT_EMAIL && \
  git config --global user.name $GIT_USERNAME  && \
  dnf install -y vim && \
  dnf install -y neovim && \
  dnf install -y nano && \
  dnf install -y emacs && \
  dnf install -y wget && \
  dnf install -y gcc && \
  dnf install -y neofetch && \
  dnf install -y strace && \
  dnf install -y valgrind && \
  dnf install -y firefox  

# change root password
RUN echo "root:$PASSWORD" | chpasswd

# add user with GIT credentials
#RUN useradd -ms /bin/bash user
#RUN echo "user:$PASSWORD" | chpasswd
#RUN usermod -aG wheel user
#USER user
#WORKDIR /home/user

# change working directory
RUN mkdir /home/user
WORKDIR /home/user
