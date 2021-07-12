#!/bin/bash

docker system info --format '{{json .}}' | jq .
