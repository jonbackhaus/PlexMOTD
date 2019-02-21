#!/bin/bash
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
source $DIR/config/colors.txt

echo -e " ${YEL}Last login..........:${NC} ${PUR}$(last | head -1 | cut -c 1-9 | xargs)${NC} at ${PUR}$(last | head -1 | cut -c 40-55 | xargs)${NC} from ${PUR}$(last | head -1 | cut -c 23-39 | xargs)${NC}"
