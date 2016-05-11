#!/bin/sh

userresources=$HOME/.Xresources
usermodmap=$HOME/.Xmodmap
sysresources=/etc/X11/xinit/.Xresources
sysmodmap=/etc/X11/xinit/.Xmodmap

# merge in defaults and keymaps

if [ -f $sysresources ]; then

    xrdb -merge $sysresources

fi

if [ -f $sysmodmap ]; then
    xmodmap $sysmodmap
fi

if [ -f "$userresources" ]; then

    xrdb -merge "$userresources"

fi

if [ -f "$usermodmap" ]; then
    xmodmap "$usermodmap"
fi

# start some nice programs

if [ -d /etc/X11/xinit/xinitrc.d ] ; then
 for f in /etc/X11/xinit/xinitrc.d/?*.sh ; do
  [ -x "$f" ] && . "$f"
 done
 unset f
fi

# Start XFCE
# exec startxfce4

# Set the XKeyboardMap to de_CH
setxkbmap ch

# Enable num lock
numlockx &

# Start the URxvt Daemon and fork to background
urxvtd --quiet --opendisplay --fork

# Start i3wm
exec i3

# Read the .Xressources file
# [[ -f ~/.Xressources ]] && xrdb -merge -I$HOME ~/.Xresources

# Start the systemd service wicd to connect to wireless networks
systemctl start wicd

