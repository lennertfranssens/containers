FROM fedora:34

ARG PASSWORD

USER root

# install and configure
RUN \
  dnf -y update && \
  dnf install -y git && \
  git config --global credential.helper store && \
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

# install manpages
RUN sed -i '/tsflags=nodocs/d' /etc/dnf/dnf.conf && \
  dnf reinstall $(dnf list --installed | awk '{print $1}') && \
  dnf install -y man-db && \
  dnf install -y man-pages

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
