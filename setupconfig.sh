#!/usr/bin/env bash

dotfiles_dir="$HOME/repos/dotfiles"
declare -A links=(
  [home/config/compton.conf]=~/.config/compton.conf
  [home/config/dunst]=~/.config/dunst
  [home/config/i3]=~/.config/i3
  [home/config/lightdm]=~/.config/lightdm
  [home/oh-my-zsh/custom/aliases.zsh]=~/.oh-my-zsh/custom/aliases.zsh
  [home/oh-my-zsh/custom/functions.zsh]=~/.oh-my-zsh/custom/functions.zsh
  [home/tp]=~/.tp
  [home/vimrc]=~/.vimrc
  [home/vim]=~/.vim
  [home/xprofile]=~/.xprofile
  [home/xresources]=~/.Xresources
  [home/zshrc]=~/.zshrc
)

