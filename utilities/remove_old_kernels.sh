#!/bin/bash
#
# Clean up old kernels after /boot fills up.  May not be relevant depending on
# how your disk is partitioned.
#

function remove() {
  local pkg=$1
  local amt=$2
  local pkgs="$(\
    dpkg --get-selections \
      | egrep "^$pkg-[0-9]" \
      | sed -e 's/\t.*//'
  )"
  local count=$(echo "$pkgs" | wc -l)
  if [[ "$amt" -lt "$count" ]]; then
    local rm_pkgs="$( echo "$pkgs" | head -n $(( $count - $amt )) )"
    sudo apt-get purge $rm_pkgs
  fi
}

remove linux-headers 4
remove linux-image 2
remove linux-image-extra 2
