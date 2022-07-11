#!/bin/sh

CHARGING="^"
DISCHARGING="-"
WARNING="!"
SUPPLY="BAT0"
BASE_DIR="/sys/class/power_supply"

CAPACITY="$(cat "$BASE_DIR/$SUPPLY/capacity")"

if [ "$(cat "$BASE_DIR/$SUPPLY/status")" == "Charging" ]; then
  STATUS="^"
else
  [ "$CAPACITY" -gt "10" ] && \
    STATUS=$DISCHARGING || \
    STATUS=$WARNING
fi

printf "[ %s %s ]\n" "$STATUS" "$CAPACITY%"