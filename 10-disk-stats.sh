#!/bin/bash
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
# source /etc/update-motd.d/colors.txt
# source /etc/update-motd.d/config.conf
. ${DIR}/config/colors.txt
. ${DIR}/config/config.conf

echo -e "${BLU}                    	Used	Avail.	Total	Percent${NC}"

for i in $(echo $DISKS | sed "s/,/ /g"); do

    if mountpoint -q $i; then
        AVAIL="$(df --output=avail $i | tail -1)"
        USED="$(df --output=used $i | tail -1)"
	SIZE="$(df --output=size $i | tail -1)"
        PERCENT="$(df --output=pcent $i | tail -1 | sed 's/\%//')"
        CHAR=$(echo 20-${#i} | bc)

	if [ $PERCENT -gt 90 ]; then
	    COLOR=${RED}
	elif [ $PERCENT -gt 75 ]; then
	    COLOR=${YEL}
	else
            COLOR=${GRN}
	fi

	echo -e " ${YEL}$i$(printf '%*s' "$CHAR" | tr ' ' "."):	${NC}$COLOR$(echo "scale=2; $USED/1073741824" | bc -l | awk '{printf "%.2f", $0}')${NC}T	$COLOR$(echo "scale=2; $AVAIL/1073741824" | bc -l | awk '{printf "%.2f", $0}')${NC}T	$COLOR$(echo "scale=2; $SIZE/1073741824" | bc -l | awk '{printf "%.2f", $0}')${NC}T	$COLOR$PERCENT${NC}%"

    fi
done
