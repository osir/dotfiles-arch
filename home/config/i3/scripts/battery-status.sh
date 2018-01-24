#!/usr/bin/env bash

c="$(cat /sys/class/power_supply/BAT0/capacity)"
s="$(cat /sys/class/power_supply/BAT0/status)"
if [ "$c" -lt 15 ]; then
    if [ "$s" != 'Charging' ]; then
        notify-send \
            --urgency=critical \
            --expire-time=60000 \
            --app-name=BATTERY \
            "Battery is low: $b%"
    fi
fi
if [ "$s" == 'Charging' ]; then
    c="⁺${c}"
fi
printf '%s%%' "$c"
