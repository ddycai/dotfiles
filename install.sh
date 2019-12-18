#!/bin/bash
# Sources config files from dotfiles repo.

DIR="${BASH_SOURCE%/*}"
. "$DIR/common.sh"

dotfiles=$HOME/dotfiles

if [ ! -d $dotfiles ]; then
  echo "Please clone the repo into $HOME."
  exit 1
fi

function join_by { local IFS="$1"; shift; echo "$*"; }

packages=("vim" "guake" "tmux" "the_silver_searcher")
packages_str=$(join_by " " ${packages[@]})

if ask "install packages: $(join_by " " ${packages[@]})?"; then
  read -p 'Enter installation command: (default pacman -S) ' install_cmd
  if [[ -z "$install_cmd" ]]; then
    install_cmd='pacman -S'
  fi
  sudo $install_cmd ${packages[@]}
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
