#!/usr/bin/env bash

choices="Shutdown\nReboot\nLogout"

choice=$(echo -e "$choices" | dmenu -i)

case "$choice" in
    'Shutdown')
        systemctl poweroff
        ;;
    'Reboot')
        systemctl reboot
        ;;
    'Logout')
        i3-msg exit
        ;;
esac

