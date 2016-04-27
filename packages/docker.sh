#!/bin/bash

set -euo pipefail

dir="$(dirname $0)"
source $dir/common.sh

# from https://docs.docker.com/installation/ubuntulinux/
list=/etc/apt/sources.list.d/docker.list
if [ ! -e $list ]; then
sudo apt-key adv \
  --keyserver hkp://p80.pool.sks-keyservers.net:80 \
  --recv-keys 58118E89F3A912897C070ADBF76221572C52609D
echo "deb https://apt.dockerproject.org/repo ubuntu-$release main" \
  | sudo tee $list \
  > /dev/null
sudo apt-get update \
  -o Dir::Etc::sourcelist="sources.list.d/$(basename $list)" \
  -o Dir::Etc::sourceparts="-" \
  -o APT::Get::List-Cleanup="0"
fi

agi docker-engine apt-cacher-ng

# set up docker group
sudo usermod -aG docker $USER

echo "log in to a new shell for group settings to take effect"
echo "reccomended: apt-cacher-ng"
