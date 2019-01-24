#!/bin/bash

if [[ $# -ne 1 ]]; then
    echo "usage: $(basename $0) <evincex://FILE[#PAGE]>"
    exit 1
fi

URI="$1"
FILE=$(echo $URI | sed -E 's;evincex://;;' | sed -E 's;(.*)#(.*);\1;')
PAGE=$(echo $URI | sed -E 's;(.*)#(.*);\2;')

#echo "$URI"
#echo "$FILE"
#echo "$PAGE"

[[ -n "$PAGE" ]] && opts[k++]=--page-label="$PAGE"
evince "$(bash -c "ls $FILE")" "${opts[@]}"
