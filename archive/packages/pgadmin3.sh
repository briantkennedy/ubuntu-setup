#!/bin/bash
#

set -x

source $(dirname $0)/common.sh
add_ppa ppa:pitti/postgresql
agi pgadmin3
