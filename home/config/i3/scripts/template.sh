#!/bin/sh

case $BLOCK_BUTTON in
    1)
        notify-send 'LMB'
        ;;
    2)
        notify-send 'MMB'
        ;;
    3)
        notify-send 'RMB'
        ;;
    4)
        notify-send 'UP'
        ;;
    5)
        notify-send 'DOWN'
        ;;
esac

echo TEMPLATE

