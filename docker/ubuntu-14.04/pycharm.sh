#!/bin/bash

source common.sh

exec docker exec \
  --interactive \
  --tty \
  $instance_name \
  /home/bkennedy/IDE/pycharm-community-4.5.4/bin/pycharm.sh
