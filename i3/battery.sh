#!/usr/bin/env bash

BATT_PATH=$(upower -e | grep BAT)
STATE=$(upower -i $BATT_PATH | grep "state" | awk '{print $2}')
PERCENT=$(upower -i $BATT_PATH | grep "percentage" | awk '{print $2}' | tr -d %)
TTE=$(upower -i $BATT_PATH | grep "time to empty" | awk '{print $4}')
TTF=$(upower -i $BATT_PATH | grep "time to full" | awk '{print $4}')

BATT_STAT=$PERCENT

if [ "$STATE" == "discharging" ]; then
    BATT_STAT="$PERCENT% DIS ($TTE)"
elif [ "$STATE" == "charging" ]; then
    BATT_STAT="$PERCENT% CHR ($TTF)"
fi

echo $BATT_STAT

if [ $PERCENT -lt 20 ]; then
    echo "#FF0000"
elif [ $PERCENT -lt 40 ]; then
    echo "#FFAE00"
elif [ $PERCENT -lt 60 ]; then
    echo "#FFF600"
elif [ $PERCENT -lt 85 ]; then
    echo "#A8FF00"
fi

if [ $PERCENT -lt 5 ]; then
    exit 33
fi

exit 0
