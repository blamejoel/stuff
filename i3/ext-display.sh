#!/usr/bin/env bash
EXTERNAL_DISP="HDMI1"
INTERNAL_DISP="eDP1"
TMP_FILE="/tmp/display.dat"

if [ -e "$TMP_FILE" ]; then
    display_mode=$(cat $TMP_FILE)

else
    display_mode="INT"
fi

# Toggles between all modes
# if [ "$display_mode" == "ALL" ]; then
#     display_mode="EXT"
#     xrandr --output $INTERNAL_DISP --off --output $EXTERNAL_DISP --auto 
# elif [ "$display_mode" == "EXT" ]; then
#     display_mode="INT"
#     xrandr --output $INTERNAL_DISP --auto --output $EXTERNAL_DISP --off 
# elif [ "$display_mode" == "INT" ]; then
#     display_mode="MIR"
#     xrandr --output $INTERNAL_DISP --auto --output $EXTERNAL_DISP --auto --same-as $INTERNAL_DISP
# else 
#     display_mode="ALL"
#     xrandr --output $INTERNAL_DISP --auto --output $EXTERNAL_DISP --auto --left-of $INTERNAL_DISP

# Toggles between internal/external monitors only
if [ "$display_mode" == "INT" ]; then
    display_mode="EXT"
    xrandr --output $INTERNAL_DISP --off --output $EXTERNAL_DISP --auto 
else 
    display_mode="INT"
    xrandr --output $INTERNAL_DISP --auto --output $EXTERNAL_DISP --off 
fi
echo "${display_mode}" > $TMP_FILE
