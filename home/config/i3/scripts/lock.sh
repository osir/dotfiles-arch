#!/bin/sh

MODE="${1:-pixel}"

case "$MODE" in
    'pixel')
        IMG='/tmp/screen.png'
        scrot "$IMG"
        convert "$IMG" -scale 10% -scale 1000% "$IMG"
        i3lock --image="$IMG" --ignore-empty-password --show-failed-attempts
        ;;
    'blank')
        i3lock --color='272822' --ignore-empty-password --show-failed-attempts
        ;;
    'win')
        WINIMG="$(find /home/osiris/images/windows-desktops/ -type f | shuf -n 1)"
        i3lock -t --pointer='win' --image="$WINIMG" --no-unlock-indicator
        ;;
esac



