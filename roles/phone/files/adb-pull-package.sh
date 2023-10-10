#!/usr/bin/bash -e

SCRIPT_DIR=$(dirname $0)

if [[ $# -ne 1 ]]; then
    echo "Usage: $(basename $0) <PACKAGE>"
    exit 1
fi

PACKAGE=${1}
VERSION=$(${SCRIPT_DIR}/adb-package-version.sh ${PACKAGE})
OUT_NAME=${PACKAGE}-${VERSION}

APK_COUNT=$(adb shell pm path ${PACKAGE} | wc -l)
if [[ ${APK_COUNT} -eq 0 ]]; then
    echo "package ${PACKAGE} not found"
    exit 1
elif [[ ${APK_COUNT} -eq 1 ]]; then
    APK_PATH=$(adb shell pm path ${PACKAGE} | awk -F: '{ print $2 }')
    adb pull ${APK_PATH} ${OUT_NAME}.apk
else
    mkdir -p ${OUT_NAME}
    for APK_PATH in $(adb shell pm path ${PACKAGE} | awk -F: '{ print $2 }'); do
        adb pull ${APK_PATH} ${OUT_NAME}/$(basename ${APK_PATH})
    done
    cat >${OUT_NAME}/README.txt <<EOF
1. Go to: "Settings" -> "Developer options"
2. Allow: "Install via USB"
3. Run:
$ adb install-multiple ${OUT_NAME}/*.apk
EOF
fi
