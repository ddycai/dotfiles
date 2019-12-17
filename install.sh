#!/bin/bash
# Sources config files from dotfiles repo.

DIR="${BASH_SOURCE%/*}"
. "$DIR/common.sh"

dotfiles=$HOME/dotfiles

if [ ! -d $dotfiles ]; then
  echo "Please clone the repo into $HOME."
  exit 1
fi

if ask "source $dotfiles/bashrc in your ~/.bashrc?"; then
  echo "source \$HOME/dotfiles/bashrc" >> "$HOME/.bashrc"
fi

if ask "source $dotfiles/vimrc in your ~/.vimrc?"; then
  echo "source \$HOME/dotfiles/vimrc" >> "$HOME/.vimrc"
fi

if ask "source $dofiles/tmux.conf in your ~/.tmux.conf"; then
  echo "source \$HOME/dotfiles/tmux.conf" >> "$HOME/.tmux.conf"
fi

if ask "make symlink for tmux themes in ~/.tmux/themes?"; then
  mkdir -p $HOME/.tmux/themes/
  ln -s $dotfiles/tmux/themes/* $HOME/.tmux/themes
fi
