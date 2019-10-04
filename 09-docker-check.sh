#!/bin/bash
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
. ${DIR}/config/colors.txt

# docker container ls
docker-pretty-ps -s -i=is
