#!/bin/bash

LAPTOP=eDP-1-0
MONITOR=VGA-1-0

# see xfce4/xfconf/xfce-perchannel-xml/xfce4-panel.xml
# todo: xfce4-appearance-settings

if [[ `xrandr | grep "${MONITOR} connected"` ]]; then
    xfconf-query --channel xfce4-panel --property /panels/panel-1/output-name --set ${MONITOR}
    xfconf-query --channel xfce4-panel --property /panels/panel-2/output-name --set ${MONITOR}
    xrandr --output HDMI1 --off --output VIRTUAL1 --off --output eDP1 --mode 1366x768 --pos 0x0 --rotate normal --output VGA1 --mode 1920x1080 --pos 1366x0 --rotate normal
else
    xfconf-query --channel xfce4-panel --property /panels/panel-1/output-name --set ${LAPTOP}
    xfconf-query --channel xfce4-panel --property /panels/panel-2/output-name --set ${LAPTOP}
fi
