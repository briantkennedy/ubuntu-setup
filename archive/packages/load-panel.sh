#!/bin/bash

dir="$(dirname $0)"
source $dir/common.sh

agi indicator-multiload
echo "Use preferences in indicator to set run on startup!"
indicator-multiload
