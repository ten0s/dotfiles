#!/bin/bash

# https://www.gnu.org/software/emacs/manual/html_node/org/External-links.html#External-links
# https://en.wikipedia.org/wiki/Uniform_Resource_Identifier

if [[ $# -ne 1 ]]; then
    echo "Usage: $(basename $0) <pdfx://FILE[::PAGE]>"
    echo "Usage: $(basename $0) <djvux://FILE[::PAGE]>"
    exit 1
fi

URI="$1"
FILE=$(echo $URI | sed -rn 's;(pdfx|djvux)://(.+\.(pdf|djvu)).*;\2;p')
PAGE=$(echo $URI | sed -rn 's;(pdfx|djvux)://.+::([[:digit:]]+).*;\2;p')
[[ -z "$PAGE" ]] && PAGE=1

echo "URI : $URI"
echo "FILE: $FILE"
echo "PAGE: $PAGE"

evince "$(bash -c "echo $FILE")" --page-label="$PAGE"
