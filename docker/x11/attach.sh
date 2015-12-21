#!/bin/bash

source common.sh

exec docker exec \
  --interactive \
  --tty \
  $instance_name \
  bash
