#!/bin/bash
# Imports the dotfiles from the repo into your home dir.

dotfiles=$HOME/dotfiles
backup=$HOME/dotfiles_old

if [ ! -d $dotfiles ]; then
  echo "Please clone the repo into $HOME."
  exit 1
fi

# Files to process
files="bashrc vimrc tmux.conf jshintrc"

echo "Creating $backup for backup of any existing dotfiles"
mkdir -p $backup

ask() {
  file=$1
  read -p "What to do with .$file? [r: replace, a: append, s: skip] " choice
  case $choice in
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
      [Ss]* ) echo "OK."; return 0;;
      * )
        echo "Invalid option. (r: replace, a: append, n: skip)"
        return 1;;
  esac
}

for file in $files; do
  while true; do
    if ask $file; then
      break
    fi
  done
done
