#!/bin/bash

set -euo pipefail

source "$(dirname "$(readlink -f "$(which $0)")")/common.sh"

exec docker \
  start \
  $instance_name
