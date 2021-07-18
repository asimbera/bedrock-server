#!/bin/sh
set -e

[[ ! -f ./server.properties ]] && echo "Required files does not exist." && exit 1

LD_LIBRARY_PATH=. ./bedrock_server
