#!/bin/bash

source ./config/colors.txt

echo -e " ${YEL}Processes...........:${NC} There are currently ${PUR}$(ps -ef | wc -l)${NC} processes running"
