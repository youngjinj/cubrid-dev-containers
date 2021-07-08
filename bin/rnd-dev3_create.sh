#!/bin/bash

# deprecated
exit

CANONICAL_PATH=`readlink -f $(dirname ${BASH_SOURCE})`

${CANONICAL_PATH}/create_development_cubrid.sh test192 192
${CANONICAL_PATH}/create_development_cubrid.sh test193 193

${CANONICAL_PATH}/create_development_cubrid.sh test194 194
${CANONICAL_PATH}/create_development_cubrid.sh test195 195

${CANONICAL_PATH}/create_development_cubrid.sh test196 196
${CANONICAL_PATH}/create_development_cubrid.sh test197 197

${CANONICAL_PATH}/create_development_cubrid.sh test198 198
${CANONICAL_PATH}/create_development_cubrid.sh test199 199

${CANONICAL_PATH}/create_development_cubrid.sh test200 200
${CANONICAL_PATH}/create_development_cubrid.sh test201 201
