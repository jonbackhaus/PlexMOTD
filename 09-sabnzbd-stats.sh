#!/bin/bash
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
source $DIR/config/colors.txt
source $DIR/config.conf
/bin/bash $DIR/config/dependency-check.sh

QUEUE="$(curl -s "$SABHOST:$SABPORT/sabnzbd/api?mode=qstatus&apikey=$SABAPI&output=json")"

echo -e " ${YEL}SABNZBD Queue.......:${NC} There are currently ${PUR}$(echo "$QUEUE" | jq ".value.noofslots_total")${NC} slots in queue"
echo -e " ${YEL}SABNZBD Speed.......:${NC} Currently downloading at ${PUR}$(echo "$QUEUE" | jq ".value.kbpersec" | tr -d '"')${NC} KB/s"
echo -e " ${YEL}Remaining...........:${NC} ${PUR}$(echo "$QUEUE" | jq ".value.mb" | tr -d '"')${NC} MB"
