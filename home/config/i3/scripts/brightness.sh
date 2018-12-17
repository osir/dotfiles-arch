#!/bin/sh

case $BLOCK_BUTTON in
    1)
        notify-send -t 1000 'Redshift' 'Disabling blue light filter...'
        redshift -rPO 6500K > /dev/null
        ;;
    3)
        notify-send -t 1000 'Redshift' 'Enabling blue light filter...'
        redshift -rPO 4500K > /dev/null
        ;;
    4)
        light -A 5
        ;;
    5)
        light -U 5
        ;;
esac

c=$(light -G | cut -d . -f 1)

printf '☀%s\n' "$c"

