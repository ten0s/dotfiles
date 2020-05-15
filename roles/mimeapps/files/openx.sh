#!/bin/bash

if [[ $# -ne 1 ]]; then
    echo "Usage: $(basename $0) <openx://FILE>"
    exit 1
fi

URI="$1"
FILE=$(echo $URI | sed -rn 's;(openx)://(.*);\2;p')

echo "URI : $URI"
echo "FILE: $FILE"

xdg-open "$(bash -c "echo $FILE")"
