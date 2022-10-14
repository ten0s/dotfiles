#!/bin/bash

# $ man 7 url | less --pattern "Man page documentation"
# https://www.gnu.org/software/emacs/manual/html_node/org/External-links.html#External-links
# https://en.wikipedia.org/wiki/Uniform_Resource_Identifier

if [[ $# -ne 1 ]]; then
    echo "Usage: $(basename $0) <manx:COMMAND[(SECTION)][::PATTERN]>"
    echo "Examples:"
    echo "  $(basename $0) manx:grep"
    echo "  $(basename $0) manx:grep(1)"
    echo "  $(basename $0) manx:grep::REGULAR+EXPRESSIONS"
    echo "  $(basename $0) manx:grep(1)::REGULAR+EXPRESSIONS"
    exit 1
fi

URI="$1"
COMMAND=$(echo $URI | sed -rn 's;manx:([[:alpha:]_-]+)(\([[:digit:]]+\))?(::.*)?;\1;p')
SECTION=$(echo $URI | sed -rn 's;manx:[[:alpha:]_-]+\(([[:digit:]]{1})\).*;\1;p')
PATTERN=$(echo $URI | sed -rn 's;manx:.*::(.*);\1;p' | sed -r 's;(\+|%20); ;g')

echo "URI    : $URI"
echo "COMMAND: $COMMAND"
echo "SECTION: $SECTION"
echo "PATTERN: $PATTERN"

if [[ -n "$PATTERN" ]]; then
    man $SECTION $COMMAND | less --pattern "$PATTERN"
else
    man $SECTION $COMMAND
fi
