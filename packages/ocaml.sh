#!/bin/bash
#
# SWI Prolog
# http://www.swi-prolog.org/build/Debian.html
#

set -x

source $(dirname $0)/common.sh

add_ppa ppa:avsm/ocaml42+opam12
agi ocaml opam

# User level:
# https://github.com/realworldocaml/book/wiki/Installation-Instructions
opam init
eval `opam config env`

opam install core utop \
   async yojson core_extended core_bench \
   cohttp async_graphics cryptokit menhir
printenv OCAML_TOPLEVEL_PATH

echo "for more info see"
echo "https://github.com/realworldocaml/book/wiki/Installation-Instructions"
