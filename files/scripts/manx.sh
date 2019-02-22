#!/bin/bash

if [[ $# -ne 1 ]]; then
    echo "usage: $(basename $0) <manx://PAGE[#SEARCH]>"
    echo "example: $(basename $0) manx://grep"
    echo "example: $(basename $0) manx://grep#REGULAR+EXPRESSIONS"
    exit 1
fi

URI="$1"
PAGE=$(echo $URI | sed -E 's;manx://;;' | sed -E 's;(.*)#(.*);\1;')
SEARCH=$(echo $URI | sed -En 's;(.*)#(.*);\2;p' | sed -E 's;\+; ;g')

#echo "$URI"
#echo "$PAGE"
#echo "$SEARCH"

if [[ -n "$SEARCH" ]]; then
    xfce4-terminal -e "bash -c 'man $PAGE | less +/\"$SEARCH\"'"
else
    xfce4-terminal -e "bash -c 'man $PAGE'"
fi
