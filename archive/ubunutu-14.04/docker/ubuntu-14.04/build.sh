#!/bin/bash

set -euo pipefail

source ./common.sh

docker build -t $image_name .
