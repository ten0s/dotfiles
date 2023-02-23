#!/bin/bash

if [[ $# -ne 1 ]]; then
    echo "Usage: $(basename $0) <openx://FILE>"
    exit 1
fi

# SYSLOG=1
# $ tail -f /var/log/syslog
source $(dirname $0)/utilx.sh

URI="$1"
FILE=$(echo $URI | sed -rn 's;openx://(.*);\1;p')

echo "--- $(basename $0) ---" | log
echo "ARGV[1]: $1"            | log
echo "URI    : $URI"          | log
echo "FILE   : $FILE"         | log

xdg-open "$(bash -c "echo $FILE")"
