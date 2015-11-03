#!/bin/bash

dir="$(dirname $0)"
source $dir/common.sh

repo=""
case "$release" in
  "precise")
    repo="deb http://apt.postgresql.org/pub/repos/apt/ precise-pgdg main"
    ;;
  "*")
    echo "handle repo for release $"
    exit 1
    ;;
esac
echo "$repo" | sudo tee /etc/apt/sources.list.d/pgdg.list

wget --quiet -O - https://www.postgresql.org/media/keys/ACCC4CF8.asc | \
  sudo apt-key add -

sudo apt-get update
agi postgresql-9.4 postgresql-doc-9.4
