#!/bin/bash

LAPTOP=eDP-1-0
MONITOR=VGA-1-0

# ~/.config/xfce4/xfconf/xfce-perchannel-xml/xfce4-panel.xml
# ~/.config/xfce4/xfconf/xfce-perchannel-xml/xsettings.xml

if [[ `xrandr | grep "${MONITOR} connected"` ]]; then
    #xrandr --output HDMI1 --off --output VIRTUAL1 --off --output eDP1 --mode 1366x768 --pos 0x0 --rotate normal --output VGA1 --mode 1920x1080 --pos 1366x0 --rotate normal
    xfconf-query --channel xfce4-panel --property /panels/panel-1/output-name --set ${MONITOR}
    xfconf-query --channel xfce4-panel --property /panels/panel-2/output-name --set ${MONITOR}
    # to update X settings (font is too small by default)
    xfconf-query --channel xsettings --property /Net/ThemeName --set "Mist"
    xfconf-query --channel xsettings --property /Net/ThemeName --set "Mint-X"
else
    xfconf-query --channel xfce4-panel --property /panels/panel-1/output-name --set ${LAPTOP}
    xfconf-query --channel xfce4-panel --property /panels/panel-2/output-name --set ${LAPTOP}
fi
