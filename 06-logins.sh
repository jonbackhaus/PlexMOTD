#!/bin/bash
# DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
# source $DIR/config/colors.txt

echo -e " ${YEL}SSH Logins..........:${NC} There are currently ${PUR}$(who | wc -l)${NC} users logged in"
