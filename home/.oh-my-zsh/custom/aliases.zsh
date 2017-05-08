# general
# -------
alias ll="\ls -lAh --color=auto --group-directories-first"
alias ls="\ls -lh --color=auto --group-directories-first"
alias l="ll"

alias vi="vim"
alias shutdown="sudo \shutdown -h now"

alias count="wc -l"
alias battery-status='upower -i /org/freedesktop/UPower/devices/battery_BAT0| grep -E "state|time\ to\ full|percentage"'
alias bat='cat /sys/class/power_supply/BAT0/capacity'

alias terminal="urxvtc -fn 'xft:Ubuntu Mono derivative Powerline:size=12:style=regular'"

alias syyu='sudo pacman -Syyu'
alias s='sudo pacman -S'

# services / daemons
# ------------------

# SSH
alias sshoff="sudo systemctl stop sshd.service"
alias sshon="sudo systemctl start sshd.service"

# other
# -----
alias öö="sl"
alias ös="sl"
