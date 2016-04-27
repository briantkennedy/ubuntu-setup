#!/bin/bash

source "$(dirname "$(readlink -f "$(which $0)")")/common.sh"

exec docker exec \
  --interactive \
  --tty \
  $instance_name \
  bash
