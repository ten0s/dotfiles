#!/usr/bin/bash -e

adb shell pm list packages | awk -F: '{ print $2 }' | sort
