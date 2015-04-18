current_path=`pwd`
dotfiles=`ls -a . | grep -e '^\.[a-z]'`

for dotfile in $dotfiles; do
  if [ -e ~/$dotfile ]; then
    if [ ! -L ~/$dotfile ]; then
      echo "~/$dotfile (exist but not symbolic link)"
    else
      echo "~/$dotfile (symbolic link updated)"
      ln -fs $current_path/$dotfile ~/$dotfile
    fi
  else
    echo "~/$dotfile (symbolic link created)"
    ln -fs $current_path/$dotfile ~/$dotfile
  fi
done
