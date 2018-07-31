#!/usr/bin/env bash
CARD=alsa_output
ANALOG=analog-stereo
BT=bluez_sink
SINK=$(pactl list sinks | grep 'Name:')
VOL_LVL="?"
MUTE="?"

if `echo ${SINK} | grep "${BT}" 1>/dev/null 2>&1`; then
    VOL_LVL=$(pactl list sinks | grep "Name: ${BT}" -A 7 | tail -1 | awk '{print $5}')
    MUTE=$(pactl list sinks | grep "Name: ${BT}" -A 7 | grep "Mute" | awk '{print $2}')
else
    VOL_LVL=$(pactl list sinks | grep "Name: ${CARD}" -A 7 | grep ${ANALOG} -A 7 | tail -1 | awk '{print $5}')
    MUTE=$(pactl list sinks | grep "Name: ${CARD}" -A 7 | grep ${ANALOG} -A 7 | grep "Mute" | awk '{print $2}')
fi

if [ "$MUTE" == "yes" ]; then
    echo "MUTE"
else
    echo "$VOL_LVL"
fi
