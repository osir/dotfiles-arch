#!/usr/bin/env bash

# In /etc/lightdm/lightdm.conf
# In section: Seat:*
#
# greeter-setup-script=/home/<user>/.config/lightdm/onlogin.sh

/usr/bin/numlockx on
urxvtd --quiet --fork

