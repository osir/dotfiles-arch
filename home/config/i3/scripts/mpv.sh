#!/bin/sh

chosen=$(rofi -dmenu -p video -i -l 0)

[ "$chosen" != "" ] || exit

mpv "$chosen"

