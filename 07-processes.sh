#!/bin/bash
# DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
# source $DIR/config/colors.txt

echo -e " ${YEL}Processes...........:${NC} There are currently ${PUR}$(ps -ef | wc -l)${NC} processes running"
