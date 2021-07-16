#!/bin/bash

# deprecated
exit

CANONICAL_PATH=`readlink -f $(dirname ${BASH_SOURCE})`

# bwkim
${CANONICAL_PATH}/create_development_cubrid.sh bwkim192 192
${CANONICAL_PATH}/create_development_cubrid.sh bwkim193 193
${CANONICAL_PATH}/create_development_cubrid.sh bwkim194 194

# shpark
${CANONICAL_PATH}/create_development_cubrid.sh shpark195 195
${CANONICAL_PATH}/create_development_cubrid.sh shpark196 196
${CANONICAL_PATH}/create_development_cubrid.sh shpark197 197

# ctshim
${CANONICAL_PATH}/create_development_cubrid.sh ctshim198 198
${CANONICAL_PATH}/create_development_cubrid.sh ctshim199 199
${CANONICAL_PATH}/create_development_cubrid.sh ctshim200 200

# hgryoo
${CANONICAL_PATH}/create_development_cubrid.sh hgryoo201 201
${CANONICAL_PATH}/create_development_cubrid.sh hgryoo202 202
${CANONICAL_PATH}/create_development_cubrid.sh hgryoo203 203

# youngjinj
${CANONICAL_PATH}/create_development_cubrid.sh youngjinj204 204
${CANONICAL_PATH}/create_development_cubrid.sh youngjinj205 205
${CANONICAL_PATH}/create_development_cubrid.sh youngjinj206 206
