#!/bin/sh

THERMAL_ZONE="thermal_zone0"

printf "[ %0.1f°C ]\n" \
  $(( $(cat "/sys/class/thermal/$THERMAL_ZONE/temp") / 1000 ))