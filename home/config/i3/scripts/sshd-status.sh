#!/bin/sh

case $BLOCK_BUTTON in
    1)
        notify-send -t 1000 'SSHD' 'Enabling ssh server...'
        sudo systemctl start sshd.service
        ;;
    3)
        notify-send -t 1000 'SSHD' 'Disabling ssh server...'
        sudo systemctl stop sshd.service
        ;;
esac

if systemctl is-active sshd.service > /dev/null
then
    printf 'on\n'
else
    printf 'off\n'
fi

