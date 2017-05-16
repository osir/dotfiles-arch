#!/usr/bin/env bash

b="$(cat /sys/class/power_supply/BAT0/capacity)"
if [ "$b" -lt 15 ]; then
    notify-send --urgency=critical --expire-time=60000 --app-name=BATTERY "Battery is low: $b%"
fi
if [ "$(cat /sys/class/power_supply/BAT0/status)" == 'Charging' ]; then
    b="⁺${b}"
fi
printf '%s%%' "$b"
