#!/bin/bash

if [[ $# -ne 1 ]]; then
    echo "usage: $(basename $0) <evincex://FILE[#PAGE]>"
    exit 1
fi

URI="$1"
FILE=$(echo $URI | sed -E 's;evincex://;;' | sed -E 's;(.*)#(.*);\1;')
PAGE=$(echo $URI | sed -En 's;(.*)#(.*);\2;p')
[[ -z "$PAGE" ]] && PAGE=1

#echo "$URI"
#echo "$FILE"
#echo "$PAGE"

evince "$(bash -c "ls $FILE")" --page-label="$PAGE"
