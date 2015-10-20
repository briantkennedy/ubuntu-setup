#!/bin/bash
#
# SWI Prolog
# http://www.swi-prolog.org/build/Debian.html
#

set -x

source ./common.sh

add_ppa ppa:avsm/ocaml42+opam12
agi ocaml
