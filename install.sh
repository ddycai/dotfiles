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

# Files requiring symlinks
files="tmux.conf jshintrc"

echo "Creating $backup for backup of any existing dotfiles"
mkdir -p $backup

for file in $files; do
  if ask "Make symlink for .$file?"; then
    echo "Backing up $HOME/.$file in $backup"
    mv $HOME/.$file $backup
    echo "Creating symlink $HOME/.$file ->  $dotfiles/$file"
    ln -s $dotfiles/$file $HOME/.$file
  fi
done

if ask "source $dotfiles/bashrc in your ~/.bashrc?"; then
  echo "source \$HOME/dotfiles/bashrc" >> "$HOME/.bashrc"
fi

if ask "source $dotfiles/vimrc in your ~/.vimrc?"; then
  echo "source \$HOME/dotfiles/vimrc" >> "$HOME/.vimrc"
fi

if ask "make symlink for tmux themes in ~/.tmux/themes?"; then
  mkdir -p $HOME/.tmux/themes/
  ln -s $dotfiles/tmux/themes/* $HOME/.tmux/themes
fi
