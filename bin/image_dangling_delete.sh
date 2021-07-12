#!/bin/bash

docker image ls -f dangling=true

docker image rm $(docker image ls -f dangling=true -q)
