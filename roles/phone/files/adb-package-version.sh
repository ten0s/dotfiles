#!/usr/bin/bash -e

SCRIPT_DIR=$(dirname $0)

if [[ $# -ne 1 ]]; then
    echo "Usage: $(basename $0) <PACKAGE>"
    exit 1
fi

PACKAGE=${1}
#echo -n "${PACKAGE} "
adb shell dumpsys package ${PACKAGE} | grep versionName | awk -F= '{ print $2 }'
