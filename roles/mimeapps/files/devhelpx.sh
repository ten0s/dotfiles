#!/bin/bash

# $ devhelp --search "std::for_each"
# sudo apt install devhelp cppreference-doc-en-html

if [[ $# -ne 1 ]]; then
    echo "Usage: $(basename $0) <devhelpx:KEYWORD>"
    echo "Examples:"
    echo "  $(basename $0) devhelpx:std::for_each"
    exit 1
fi

# SYSLOG=1
# $ tail -f /var/log/syslog
source $(dirname $0)/utilx.sh

URI="$1"
KEYWORD=$(echo $URI | sed -rn 's;devhelpx:(.*);\1;p')

echo "--- $(basename $0) ---" | log
echo "ARGV[1]: $1"            | log
echo "URI    : $URI"          | log
echo "KEYWORD: $KEYWORD"      | log

devhelp --search "$KEYWORD"
