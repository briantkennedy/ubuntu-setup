#!/bin/bash

release="$(lsb_release -cs)"

# apt-get install wrapper
agi() {
  local package="$1"
  sudo apt-get install --yes "$package"
}

add_ppa() {
  local ppa="$1"
  agi python-software-properties
  sudo apt-add-repository --yes "$ppa"
  sudo apt-get update
}

cache_cfg=/etc/apt/apt.conf.d/01proxy
disable_cache() {
  mv $cache_cfg ./
}
enable_cache() {
  mv ./01proxy $cache_cfg
}
