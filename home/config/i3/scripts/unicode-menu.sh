#!/bin/sh

chosen=$(grep -v "#" ~/.config/emoji.csv | rofi -dmenu -p copy -i -l 20)

[ "$chosen" != "" ] || exit

c=$(echo "$chosen" | sed 's/ .*$//')
printf "$c" | xclip -selection primary
printf "$c" | xclip -selection clipboard
notify-send 'Unicode Menu' "'$c' copied to clipboard." &


