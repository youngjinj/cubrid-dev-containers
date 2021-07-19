#!/bin/bash

CANONICAL_PATH=`readlink -f $(dirname ${BASH_SOURCE})`

VERSION=`cd ${CANONICAL_PATH} && cat version`
COMMIT_TAG=v${VERSION}

# `date -d @$(stat --printf='%Z' ${CANONICAL_PATH}/Dockerfile) -u +'%Y-%m-%dT%H:%M:%SZ'`
COMMIT_DATE=`date -d @$(cd ${CANONICAL_PATH} && git show --format=%ct | head -1) -u +'%Y-%m-%dT%H:%M:%SZ'`

COMMIT_ID=`cd ${CANONICAL_PATH} && git show --format=%h | head -1`

IS_NEW_TAG="Y"

if [ "${IS_NEW_TAG}" == "Y" ]; then
	git tag -f ${COMMIT_TAG} ${COMMIT_ID}

	echo ""
        echo ${COMMIT_TAG}: `git describe --tags --exact-match`
	echo ""
fi

# `cd ${CANONICAL_PATH} && git symbolic-ref -q --short HEAD`
# `cd ${CANONICAL_PATH} && git describe --tags --exact-match`

cat <<EOF > ${CANONICAL_PATH}/build_arg
{
	"CREATED": "${COMMIT_DATE}",
	"REVISION": "${COMMIT_ID}",
	"REF_NAME": "${COMMIT_TAG}"
}
EOF

cat ${CANONICAL_PATH}/build_arg
