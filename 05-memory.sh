#!/bin/bash
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
# source $DIR/config/colors.txt
. ${DIR}/config/colors.txt

echo -e " ${YEL}Memory..............:${NC} Used: ${PUR}$(free -m | grep Mem: | xargs | cut -f3 -d' ')${NC} MB | Free: ${PUR}$(free -m | grep Mem: | xargs | cut -f7 -d' ')${NC} MB | Total: ${PUR}$(free -m | grep Mem: | xargs | cut -f2 -d' ')${NC} MB"
