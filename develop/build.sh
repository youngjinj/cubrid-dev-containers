#!/bin/bash

TAG_NAME=`date "+%Y-%m-%d"`

docker build --rm -t develop:${TAG_NAME} .
