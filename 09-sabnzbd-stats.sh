#!/bin/bash

source ./config/colors.txt
source ./config.conf
/bin/bash ./config/dependency-check.sh

QUEUE="$(curl -s "$SABHOST:$SABPORT/sabnzbd/api?mode=qstatus&apikey=$SABAPI&output=json")"

echo -e " ${YEL}SABNZBD Queue.......:${NC} There are currently ${PUR}$(echo "$QUEUE" | jq ".value.noofslots_total")${NC} slots in queue"
echo -e " ${YEL}SABNZBD Speed.......:${NC} Currently downloading at ${PUR}$(echo "$QUEUE" | jq ".value.kbpersec" | tr -d '"')${NC} KB/s"
echo -e " ${YEL}Remaining...........:${NC} ${PUR}$(echo "$QUEUE" | jq ".value.mb" | tr -d '"')${NC} MB"
