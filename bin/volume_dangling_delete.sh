#!/bin/bash

docker volume ls -f dangling=true

docker volume rm $(docker volume ls -f dangling=true -q)
