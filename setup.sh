dotfiles_dir=/home/osiris/repos/dotfiles
declare -A links=( 
  [home/.config/compton.conf]=~/.config/compton.conf
  [home/.config/dunst]=~/.config/dunst
  [home/.config/i3]=~/.config/i3
  [home/.config/lightdm]=~/.config/lightdm
  [home/.oh-my-zsh/custom/aliases.zsh]=~/.oh-my-zsh/custom/aliases.zsh
  [home/.oh-my-zsh/custom/functions.zsh]=~/.oh-my-zsh/custom/functions.zsh
  [home/.tp]=~/.tp
  [home/.vimrc]=~/.vimrc
  [home/.vim]=~/.vim
  [home/.xprofile]=~/.xprofile
  [home/.Xresources]=~/.Xresources
  [home/.zshrc]=~/.zshrc
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
