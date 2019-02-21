#!/bin/bash
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
source $DIR/config/colors.txt

service_check(){

 STATE=$(service $1 status | grep "active (running)" | wc -l)
	if [ "$STATE" = "1" ]; then
		echo -e "${GRN}OK!${NC}"
	else
		echo -e "${RED}Not running...${NC}"
	fi
}

PLEXSTATE=$(service_check plexmediaserver)
TAUTSTATE=$(service_check tautulli)

echo -e " ${YEL}Plex Status.........:${NC} $(echo $PLEXSTATE)"
echo -e " ${YEL}Tautulli Satus......:${NC} $(echo $TAUTSTATE)"
