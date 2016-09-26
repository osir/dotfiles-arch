dotfiles_dir=/home/osiris/repos/dotfiles
declare -A links=( 
  [home/.Xresources]=~/.Xresources
  [home/.xprofile]=~/.xprofile
  [home/.zshrc]=~/.zshrc
  [home/.config/i3]=~/.config/i3
  [home/.config/dunst]=~/.config/dunst
  [home/.config/lightdm]=~/.config/lightdm
  [home/.oh-my-zsh/custom]=~/.oh-my-zsh/custom
  [home/.vim]=~/.vim
  [home/.vimrc]=~/.vimrc
)

mode=$1
if [ "$mode" = "clean" ]; then
  echo "Removing links:"
  for i in "${!links[@]}"
  do
  echo "rm ${links[$i]}"
    rm ${links[$i]}
  done
else
  echo "creating links:"
  for i in "${!links[@]}"
  do
    echo "$PWD/$i -> ${links[$i]}"
    ln -s $PWD/$i ${links[$i]}
  done
fi
