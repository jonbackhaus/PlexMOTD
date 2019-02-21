#!/bin/bash

source ./config/colors.txt
source ./config.conf
/bin/bash ./config/dependency-check.sh

LIST="$(transmission-remote -n $TRANSUSER:$TRANSPASS -l)"
STATS="$(transmission-remote -n $TRANSUSER:$TRANSPASS -st | tail -5)"

echo -e " ${YEL}Torrents............:${NC} There are currently ${PUR}$(echo "$(echo "$LIST" | wc -l) - 2" | bc)${NC} torrents in Transmission"
echo -e " ${YEL}Seeding Torrents....:${NC} There are currently ${PUR}$(echo "$LIST" | grep Seeding | wc -l)${NC} torrents actively seeding"
echo -e " ${YEL}Downloaded..........:${NC} ${PUR}$(echo "$STATS" | grep Downloaded | cut -f2 -d':' | xargs)${NC}"
echo -e " ${YEL}Uploaded............:${NC} ${PUR}$(echo "$STATS" | grep Uploaded | cut -f2 -d':' | xargs)${NC}"
echo -e " ${YEL}Ratio...............:${NC} ${PUR}$(echo "$STATS" | grep Ratio | cut -f2 -d':' | xargs)${NC}"
