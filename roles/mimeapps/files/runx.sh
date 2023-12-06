#!/bin/bash

if [[ $# -ne 1 ]]; then
    echo "Usage: $(basename $0) <runx://PROG>"
    exit 1
fi

# TODO: Support PROG [ARG1 [ARG2 ...]]

# SYSLOG=1
# $ tail -f /var/log/syslog
source $(dirname $0)/utilx.sh

URI="$1"
PROG=$(echo $URI | sed -rn 's;runx://(.*);\1;p')

echo "--- $(basename $0) ---" | log
echo "ARGV[1]: $1"            | log
echo "URI    : $URI"          | log
echo "PROG   : $PROG"         | log

exec "$PROG"
