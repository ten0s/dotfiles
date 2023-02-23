#!/bin/bash

function urldecode() {
    python3 <<< "import urllib.parse; print(urllib.parse.unquote_plus('$1'))"
}

# SYSLOG=1
# $ tail -f /var/log/syslog
function log() {
    if [[ -n $SYSLOG ]]; then
        tee /dev/stderr | logger
    else
        cat >&2
    fi
}
