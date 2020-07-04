#!/bin/bash

if [[ $# -lt 1 ]]; then
    echo "Usage: $(basename $0) ROWSxCOLS [FILE ...]"
    echo "Transform incorrectly copied table from book"
    echo "Example:"
    echo "$ echo -e '11\n12\n13\n21\n22\n23' | to-table.sh 2x3"
    echo "11  13  22"
    echo "12  21  23"
    exit 1
fi

size=$1
shift
awk -f <(sed -rne '/^#BEGIN_AWK/,/^#END_AWK/p' $0) \
    -v size=$size -v OFS='\t' "$@"
exit $PIPESTATUS

#BEGIN_AWK
BEGIN {
    if (!size) {
        usage()
        exit(1)
    }
    x = index(size, "x")
    if (!x) {
        usage()
        exit(1)
    }
    rows = substr(size, 1, x - 1) + 0
    cols = substr(size, x + 1) + 0
}

{
    lines[NR] = $0
}

END {
    for (i = 1; i <= rows; i++) {
        for (j = 1; j <= cols; j++) {
            k = i + (j - 1) * rows
            printf("%s", lines[k])
            if (j != cols) printf("%s", OFS)
        }
        printf("\n");
    }
}

function usage() {
    printf("usage: %s -v size=ROWSxCOLS FILE ...\n", ARGV[0])
}
#END_AWK
