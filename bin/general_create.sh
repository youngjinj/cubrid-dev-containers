#!/bin/bash

# deprecated
# exit

CANONICAL_PATH=`readlink -f $(dirname ${BASH_SOURCE})`

# tech30 - hiclass
${CANONICAL_PATH}/create_development_cubrid.sh tech30 30
