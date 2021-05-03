FROM fedora:34

ARG GIT_EMAIL
ARG GIT_USERNAME
ARG GIT_PASSWORD

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
RUN echo 'root:e=mc**2' | chpasswd

# add user with GIT credentials
RUN useradd -ms /bin/bash $GIT_USERNAME
RUN echo "$GIT_USERNAME:$GIT_PASSWORD" | chpasswd
RUN usermod -aG wheel $GIT_USERNAME

USER $GIT_USERNAME
WORKDIR /home/$GIT_USERNAME

# download os lab
RUN git clone https://$GIT_USERNAME:$GIT_PASSWORD@github.ugent.be/lefranss-besturingssystemen2/lab.git /home/$GIT_USERNAME/bsys2/lab
