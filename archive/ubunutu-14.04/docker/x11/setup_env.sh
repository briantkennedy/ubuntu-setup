#!/bin/bash

source common.sh

# TODO: determine if I should just add these as mount points.
cd $HOME
ln -s $home_mountpoint/.ssh
ln -s $home_mountpoint/.m2
