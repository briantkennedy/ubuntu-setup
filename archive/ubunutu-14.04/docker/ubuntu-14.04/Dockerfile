# Set up a dev environment
FROM ubuntu:14.04

COPY etc/apt/apt.conf.d/01proxy /etc/apt/apt.conf.d/01proxy
RUN echo "if [ -f /etc/bash_completion ] && ! shopt -oq posix; then . /etc/bash_completion; fi" >> /root/.bashrc

RUN apt-get update
# get rid of all the warnings
RUN apt-get install -y dialog
RUN apt-get install -y \
  apt-rdepends \
  aptitude \
  autoconf \
  autotools-dev \
  bash-completion \
  devscripts \
  dialog \
  dpkg-dev \
  equivs \
  gdb \
  git \
  gnome-terminal \
  less \
  net-tools \
  openssh-client \
  psmisc \
  screen \
  software-properties-common \
  stow \
  sudo \
  wget \
  vim

RUN adduser brian

# requires sudo
RUN echo "brian ALL=(ALL) NOPASSWD: ALL" > /etc/sudoers.d/brian
RUN chmod 0440 /etc/sudoers.d/brian

USER brian
ENV HOME /home/brian
ENV USER brian
