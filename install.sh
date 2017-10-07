#!/bin/bash
# Imports the dotfiles from the repo into your home dir.

DIR="${BASH_SOURCE%/*}"
. "$DIR/common.sh"

dotfiles=$HOME/dotfiles
backup=$HOME/dotfiles_old

if [ ! -d $dotfiles ]; then
  echo "Please clone the repo into $HOME."
  exit 1
fi

# Files to process
files="tmux.conf jshintrc"

echo "Creating $backup for backup of any existing dotfiles"
mkdir -p $backup

ask_for_file() {
  file=$1
  read -p "What to do with .$file? [r: replace, a: append, s: skip] " -n 1 -r
  echo
  case $REPLY in
      [Rr]* )
        echo "Backing up $HOME/.$file in $backup"
        mv $HOME/.$file $backup
        echo "Replacing $HOME/.$file"
        cp $dotfiles/$file $HOME/.$file
        return 0;;
      [Aa]* )
        echo "Backing up $HOME/.$file in $backup"
        cp $HOME/.$file $backup
        echo "Appending to $HOME/.$file"
        cat "$dotfiles/$file" >> "$HOME/.$file"
        return 0;;
      [Ss]* ) return 0;;
      * )
        echo "Invalid option. (r: replace, a: append, n: skip)"
        return 1;;
  esac
}

for file in $files; do
  while true; do
    if ask_for_file $file; then
      break
    fi
  done
done

if ask "source $dotfiles/bashrc in your ~/.bashrc?"; then
  echo "source \$HOME/dotfiles/bashrc" >> "$HOME/.bashrc"
fi

if ask "source $dotfiles/vimrc in your ~/.vimrc?"; then
  echo "source \$HOME/dotfiles/vimrc" >> "$HOME/.vimrc"
fi
