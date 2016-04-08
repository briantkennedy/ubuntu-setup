#!/bin/bash

set -euo pipefail

dir="$(dirname $0)"
source $dir/common.sh

repo=""
case "$release" in
  "trusty")
    repo="deb http://apt.postgresql.org/pub/repos/apt/ trusty-pgdg main"
    ;;
  "precise")
    repo="deb http://apt.postgresql.org/pub/repos/apt/ precise-pgdg main"
    ;;
  "wily")
    repo="deb http://apt.postgresql.org/pub/repos/apt/ wily-pgdg main"
    ;;
  "xenial")
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
