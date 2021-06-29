#!/bin/bash

TAG_NAME="develop:20210624"

docker build --rm -t ${TAG_NAME} .
