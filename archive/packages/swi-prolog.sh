#!/bin/bash
#
# SWI Prolog
# http://www.swi-prolog.org/build/Debian.html
#

set -ex

source $(dirname $0)/common.sh
add_ppa ppa:swi-prolog/stable
agi swi-prolog
