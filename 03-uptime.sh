#!/bin/bash

source ./config/colors.txt

echo -e " ${YEL}Uptime..............:${NC} ${PUR}$(uptime -p | sed 's/^up.//')${NC}"
