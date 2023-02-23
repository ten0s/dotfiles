#!/bin/bash -i

if [[ $# -ne 1 ]]; then
    echo "Usage: $(basename $0) <remsh://NAME@HOST>"
    exit 1
fi

# SYSLOG=1
# $ tail -f /var/log/syslog
source $(dirname $0)/utilx.sh

URI="$1"
NODE=$(echo $URI | sed -rn 's;remsh://(.*);\1;p')

echo "--- $(basename $0) ---" | log
echo "ARGV[1]: $1"            | log
echo "URI    : $URI"          | log
echo "NODE   : $NODE"         | log

rerl $NODE remsh
