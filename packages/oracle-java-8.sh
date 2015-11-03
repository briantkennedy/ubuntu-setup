#!/bin/bash
#
#

set -x

source $(dirname $0)/common.sh

add_ppa ppa:webupd8team/java
agi oracle-java8-installer
