#!/bin/bash
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
source $DIR/config/colors.txt

echo -e " ${YEL}Load Averages.......:${NC} 1 min: ${PUR}$(cat /proc/loadavg | cut -f1 -d' ')%${NC} 5 mins: ${PUR}$(cat /proc/loadavg | cut -f2 -d' ')%${NC} 15 mins: ${PUR}$(cat /proc/loadavg | cut -f3 -d' ')%${NC}"
