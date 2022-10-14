#!/bin/bash

# $ devhelp --search "std::for_each"
# sudo apt install devhelp cppreference-doc-en-html

if [[ $# -ne 1 ]]; then
    echo "Usage: $(basename $0) <devhelpx:KEYWORD>"
    echo "Examples:"
    echo "  $(basename $0) devhelpx:std::for_each"
    exit 1
fi

URI="$1"
KEYWORD=$(echo $URI | sed -rn 's;devhelpx:(.*);\1;p')

echo "URI    : $URI"
echo "KEYWORD: $KEYWORD"

devhelp --search "$KEYWORD"
