#!/usr/bin/env bash
# copy this script to /lib/systemd/system-sleep/ to switch back to internal 
# display on resume from sleep. Test by running systemctl suspend

case "$1" in
    post)
        su joel -c '
        EXTERNAL_DISP="HDMI1"
        INTERNAL_DISP="eDP1"
        TMP_FILE="/tmp/display.dat"

        if [ -e "$TMP_FILE" ]; then
            display_mode=$(cat $TMP_FILE)

        else
            display_mode="INT"
        fi

        export DISPLAY=:0
        display_mode="INT"
        xrandr --output $INTERNAL_DISP --auto --output $EXTERNAL_DISP --off 
        echo "${display_mode}" > $TMP_FILE'
            ;;
esac
