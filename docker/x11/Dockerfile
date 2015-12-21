# Set up a dev environment
FROM ubuntu:12.04

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
  gnome-terminal \
  less \
  net-tools \
  openssh-client \
  psmisc \
  screen \
  stow \
  sudo \
  vim

RUN adduser bkennedy

# requires sudo
RUN echo "bkennedy ALL=(ALL) NOPASSWD: ALL" > /etc/sudoers.d/bkennedy
RUN chmod 0440 /etc/sudoers.d/bkennedy

USER bkennedy
ENV HOME /home/bkennedy
