# ls
alias  l="\ls -lh --color=auto --group-directories-first"
alias ll="\ls -lAh --color=auto --group-directories-first"

# pacman
alias syyu='sudo pacman -Syyu'
alias    s='sudo pacman -S'

# SSH
alias sshoff='sudo systemctl stop sshd.service'
alias  sshon='sudo systemctl start sshd.service'

# Screen resolutions
alias 1080p='
    sudo xrandr --newmode "1080p" 173.00 1920 2048 2248 2576 1080 1083 1088 1120 -hsync +hsync;
    sudo xrandr --addmode "eDP-1" "1080p";
    xrandr --output "eDP-1" --mode "1080p"'
alias 1440p=''

# other
alias             ra='ranger'
alias             vi='vim'
alias             li='light -S'
alias            ipa='ip --color --brief addr'
alias            ddg='w3m "https://duckduckgo.com"'
alias       terminal="urxvtc -fn 'xft:Ubuntu Mono derivative Powerline:size=12:style=regular'"
alias battery-status='upower -i /org/freedesktop/UPower/devices/battery_BAT0| grep -E "state|time\ to\ full|percentage"'

