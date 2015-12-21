#!/bin/bash

source common.sh

BIN=bash
if [[ "$1" != "" ]]; then
  BIN="$1"
fi

mkdir -p $vm_home
docker \
  run \
  --net host \
  --name $instance_name \
  --env DISPLAY=$DISPLAY \
  --volume $HOME/.Xauthority:$HOME/.Xauthority \
  --volume $vm_home:/home/$USER \
  --volume $HOME:$home_mountpoint \
  --tty \
  --interactive \
  --workdir /home/$USER \
  $image_name \
  $BIN
