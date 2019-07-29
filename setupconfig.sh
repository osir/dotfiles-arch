#!/usr/bin/env bash

dotfiles_dir="$HOME/repos/dotfiles"
declare -A links=(
  [home/config/compton.conf]=~/.config/compton.conf
  [home/config/emoji.csv]=~/.config/emoji.csv
  [home/config/dunst]=~/.config/dunst
  [home/config/i3]=~/.config/i3
  [home/config/nvim/init.vim]=~/.config/nvim/init.vim
  [home/config/lightdm]=~/.config/lightdm
  [home/oh-my-zsh/custom/aliases.zsh]=~/.oh-my-zsh/custom/aliases.zsh
  [home/oh-my-zsh/custom/functions.zsh]=~/.oh-my-zsh/custom/functions.zsh
  [home/tp]=~/.tp
  [home/vim]=~/.vim
  [home/xprofile]=~/.xprofile
  [home/xresources]=~/.Xresources
  [home/xres]=~/.xres
  [home/zshrc]=~/.zshrc
)

