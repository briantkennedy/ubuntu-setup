#!/bin/bash

set -euo pipefail

dir="$(dirname $0)"
source $dir/common.sh

repo=""
case "$release" in
  "trusty") # 14.04
    repo="deb http://apt.postgresql.org/pub/repos/apt/ trusty-pgdg main"
    ;;
  "xenial") # 16.04
    repo="deb http://apt.postgresql.org/pub/repos/apt/ xenial-pgdg main"
    ;;
  *)
    echo "handle repo for release $release"
    exit 1
    ;;
esac
echo "$repo" | sudo tee /etc/apt/sources.list.d/pgdg.list

wget --quiet -O - https://www.postgresql.org/media/keys/ACCC4CF8.asc | \
  sudo apt-key add -

sudo apt-get update
agi postgresql-9.4 postgresql-doc-9.4
