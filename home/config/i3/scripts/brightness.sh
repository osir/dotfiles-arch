#!/bin/sh

case $BLOCK_BUTTON in
    1)  # LMB
        notify-send -t 1000 'Redshift' 'Disabling blue light filter...'
        redshift -rPO 6500K > /dev/null
        ;;
    2)  # MMB
        notify-send -t 1000 'Brightness' 'Enabling ultra low brightness...'
        light -S 0.1
        notify-send -t 1000 'Redshift' 'Enabling blue light filter...'
        redshift -rPO 4500K > /dev/null
        ;;
    3)  # RMB
        notify-send -t 1000 'Redshift' 'Enabling blue light filter...'
        redshift -rPO 4500K > /dev/null
        ;;
    4)  # UP
        light -A 5
        ;;
    5)  # DOWN
        light -U 5
        ;;
esac

c=$(light -G | cut -d . -f 1)
printf '☀%s\n' "$c"

