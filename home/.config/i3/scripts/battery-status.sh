#!/usr/bin/env bash

b="$(cat /sys/class/power_supply/BAT0/capacity)"
if [ "$(cat /sys/class/power_supply/BAT0/status)" == 'Charging' ]; then
    b="${b}⁺"
fi
printf "$b"
