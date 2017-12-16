#!/usr/bin/env bash
SINK=$(pactl list sinks | grep 'Name:')
# SINK=$(pacmd list-sinks | grep 'name:')
DEV=bluez_sink
DAC=alsa_output.usb-FiiO_FiiO_USB_DAC_K1-01.analog-stereo
# DEV=bluez

if `echo ${SINK} | grep "${DAC}" 1>/dev/null 2>&1`; then
    echo $(pactl list sinks | grep "Name: ${DAC}" -B 3 | grep '#' | awk '{print $2}' | sed 's/#//')
elif `echo ${SINK} | grep "${DEV}" 1>/dev/null 2>&1`; then
    # echo $(pacmd list-sinks | grep 'card:' | grep 'bluez' | awk '{print $2}')
    echo $(pactl list sinks | grep 'Name: bluez_sink' -B 3 | grep '#' | awk '{print $2}' | sed 's/#//')
else
    echo "1"
fi
