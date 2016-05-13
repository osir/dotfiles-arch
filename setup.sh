declare -A links=( 
  [home/.Xresources]=~/.Xresources
  [home/.config/i3]=~/.config/i3
  [homt/.config/dunst]=~/.config/dunst
)

mode=$1
if [ "$mode" = "clean" ]; then
  echo "Removing links:"
  for i in "${!links[@]}"
  do
  echo "rm ${!links[$i]}"
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
