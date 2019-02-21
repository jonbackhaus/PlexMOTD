#!/bin/bash

source ./config/colors.txt

echo -e " ${YEL}SSH Logins..........:${NC} There are currently ${PUR}$(who | wc -l)${NC} users logged in"
