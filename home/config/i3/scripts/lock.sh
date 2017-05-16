#!/usr/bin/env bash

img='/tmp/screen.png'

while [ "$1" ]; do
    case "$1" in
        *screenshot*)
            scrot "$img"
            ;;
        *pixelate*)
            convert "$img" -scale 10% -scale 1000% "$img"
            ;;
        *icon*)
            icon="$HOME/.config/i3/lockicon.png"
            convert "$img" "$icon" -gravity center -composite -matte "$img"
            ;;
        *lock*)
            i3lock -i "$img"
            ;;
    esac
    shift
done

