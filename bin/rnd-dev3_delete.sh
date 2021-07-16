#!/bin/bash

# deprecated
exit

CANONICAL_PATH=`readlink -f $(dirname ${BASH_SOURCE})`

${CANONICAL_PATH}/stop_rm_with_volume.sh bwkim192
${CANONICAL_PATH}/stop_rm_with_volume.sh bwkim193
${CANONICAL_PATH}/stop_rm_with_volume.sh bwkim194

${CANONICAL_PATH}/stop_rm_with_volume.sh shpark195
${CANONICAL_PATH}/stop_rm_with_volume.sh shpark196
${CANONICAL_PATH}/stop_rm_with_volume.sh shpark197

${CANONICAL_PATH}/stop_rm_with_volume.sh ctshim198
${CANONICAL_PATH}/stop_rm_with_volume.sh ctshim199
${CANONICAL_PATH}/stop_rm_with_volume.sh ctshim200

${CANONICAL_PATH}/stop_rm_with_volume.sh hgryoo201
${CANONICAL_PATH}/stop_rm_with_volume.sh hgryoo202
${CANONICAL_PATH}/stop_rm_with_volume.sh hgryoo203

${CANONICAL_PATH}/stop_rm_with_volume.sh youngjinj204
${CANONICAL_PATH}/stop_rm_with_volume.sh youngjinj205
${CANONICAL_PATH}/stop_rm_with_volume.sh youngjinj206

