#!/usr/bin/env bash
CARD=alsa_output
ANALOG=analog-stereo
BT=bluez_sink
SINK=$(pactl list sinks | grep 'Name:')

#TODO improve ugly redundant code
if `echo ${SINK} | grep "${BT}" 1>/dev/null 2>&1`; then
    VOL_PCT=$(pactl list sinks | grep "Name: ${BT}" -A 7 | tail -1 | awk '{print $5}')
    MUTE=$(pactl list sinks|grep "Name: ${BT}" -A7|grep "Mute"|awk '{print $2}')
    if [ "$MUTE" = "yes" ]; then
        echo "MUTE"
    else
        echo $VOL_PCT
    fi
else
    VOL_PCT=$(pactl list sinks | grep "Name: ${CARD}" -A 7 | grep ${ANALOG} -A 7 | tail -1 | awk '{print $5}')
    MUTE=$(pactl list sinks|grep "Name: ${CARD}" -A7|grep ${ANALOG} -A7|grep "Mute"|awk '{print $2}')
    if [ "$MUTE" = "yes" ]; then
        echo "MUTE"
    else
        echo $VOL_PCT
    fi
fi

