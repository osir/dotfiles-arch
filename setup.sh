dotfiles_dir=/home/osiris/repos/dotfiles
declare -A links=( 
  [home/.Xresources]=~/.Xresources
  [home/.xprofile]=~/.xprofile
  [home/.zshrc]=~/.zshrc
  [home/.config/i3]=~/.config/i3
  [home/.config/dunst]=~/.config/dunst
  [home/.config/lightdm]=~/.config/lightdm
  [home/.config/compton.conf]=~/.config/compton.conf
  [home/.oh-my-zsh/custom/functions.zsh]=~/.oh-my-zsh/custom/functions.zsh
  [home/.oh-my-zsh/custom/aliases.zsh]=~/.oh-my-zsh/custom/aliases.zsh
  [home/.vim]=~/.vim
  [home/.vimrc]=~/.vimrc
)

cd "$dotfiles_dir" || exit 1

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
