#!/bin/bash -i

if [[ $# -ne 1 ]]; then
    echo "Usage: $(basename $0) <remsh://NAME@HOST>"
    exit 1
fi

URI="$1"
NODE=$(echo $URI | sed -rn 's;remsh://(.*);\1;p')

echo "URI : $URI"
echo "NODE: $NODE"

rerl $NODE remsh
