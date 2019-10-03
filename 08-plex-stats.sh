#!/bin/bash
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
# source $DIR/config.conf
# source $DIR/config/colors.txt
# /bin/bash $DIR/config/dependency-check.sh

. ${DIR}/config/config.conf
. ${DIR}/config/colors.txt
exec ${DIR}/config/dependency-check.sh

PLEXSTATS="$(curl -s "$TAUTIP:$TAUTPORT/api/v2?apikey=$TAUTAPI&cmd=get_activity")"

echo -e " ${YEL}Plex Streams........:${NC} There are currently ${PUR}$(curl -s "$TAUTIP:$TAUTPORT/api/v2?apikey=$TAUTAPI&cmd=get_activity" | tac | tac | jq '.response.data.stream_count' | tr -d '"')${NC} users streaming on Plex"
echo -e " ${YEL}Plex Bandwidth......:${NC} Plex streams are using ${PUR}$(echo "scale=2; $(echo $PLEXSTATS | jq '.response.data.total_bandwidth') / 1024" | bc)${NC} mbps total"
echo -e " ${YEL}                     ${NC} (${PUR}$(echo "scale=2; $(echo $PLEXSTATS | jq '.response.data.wan_bandwidth') / 1024" | bc)${NC} mbps WAN, ${PUR}$(echo "scale=2; $(echo $PLEXSTATS | jq '.response.data.lan_bandwidth') / 1024" | bc)${NC} mbps LAN)"
