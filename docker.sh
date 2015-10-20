#!/bin/bash

dir="$(dirname $0)"
source $dir/common.sh

# from https://docs.docker.com/installation/ubuntulinux/
list=/etc/apt/sources.list.d/docker.list
if [ ! -e $list ]; then
sudo apt-key adv \
  --keyserver hkp://pgp.mit.edu:80 \
  --recv-keys 58118E89F3A912897C070ADBF76221572C52609D
cp -f $dir/etc/apt/sources.list.d/docker.list  $list
sudo apt-get update
fi

agi docker-engine

# set up docker group
sudo usermod -aG docker $USER

echo "log in to a new shell for group settings to take effect"
