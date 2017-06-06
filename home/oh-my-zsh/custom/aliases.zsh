# ls
alias ll="\ls -lAh --color=auto --group-directories-first"
alias ls="\ls -lh --color=auto --group-directories-first"
alias l='ll'

# pacman
alias syyu='sudo pacman -Syyu'
alias s='sudo pacman -S'

# SSH
alias sshoff='sudo systemctl stop sshd.service'
alias sshon='sudo systemctl start sshd.service'

# other
alias fm='vifm . ~'
alias vi='vim'
alias terminal="urxvtc -fn 'xft:Ubuntu Mono derivative Powerline:size=12:style=regular'"
alias battery-status='upower -i /org/freedesktop/UPower/devices/battery_BAT0| grep -E "state|time\ to\ full|percentage"'

