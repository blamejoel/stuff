#!/usr/bin/env bash
EXTERNAL_DISP="HDMI1"
INTERNAL_DISP="eDP1"
TMP_FILE="/tmp/display.dat"

if [ -e "$TMP_FILE" ]; then
    display_mode=$(cat $TMP_FILE)

else
    display_mode="INT"
fi

if [ "$display_mode" == "MIR" ]; then
    display_mode="INT"
    xrandr --output $INTERNAL_DISP --auto --output $EXTERNAL_DISP --off 
else 
    display_mode="MIR"
    xrandr --output $INTERNAL_DISP --auto --output $EXTERNAL_DISP --auto --same-as $INTERNAL_DISP
fi
echo "${display_mode}" > $TMP_FILE

