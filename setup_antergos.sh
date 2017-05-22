#!/bin/bash
# Script for setting up antergos the way I like it.

ask() {
  read -p "$1 [y/n] " -n 1 -r
  echo
  if [[ $REPLY =~ ^[Yy]$ ]]; then
    return 0
  fi
  return 1
}

if (( $# != 2 )); then
  echo "Usage: setup_antergos.sh <git-name> <git-email>"
  exit 1
fi

is_gnome=false
restart_gnome=false

# ==================== Setup ====================
if ask "Change hardware clock standard to localtime?"; then
  timedatectl set-local-rtc 1
fi

# Update grub.
if ask "Update grub?"; then
  echo "Updating grub..."
  sudo grub-mkconfig -o /boot/grub/grub.cfg
fi

# Set up your git email.
if ask "Set up your git username and email?"; then
  echo "Setting up your git name as $1..."
  git config --global user.name "$1"
  echo "Setting up your git email as $2..."
  git config --global user.email "$2"
fi

# Install vim.
if ask "Install vim?"; then
  echo "Installing vim..."
  sudo pacman -S vim
fi

# Installing variety.
if ask "Install variety?"; then
  echo "Installing variety..."
  sudo pacman -S variety
  restart_gnome=true
fi

# Install vundle and copy my dotfiles.
if ask "Install vundle?"; then
  git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
fi

if ask "Install dotfiles and make symlinks?"; then
  git clone https://github.com/frigidrain/dotfiles.git ~/dotfiles
  bash ~/dotfiles/makesymlinks.sh
fi

# Install redshift.
if ask "Install redshift?"; then
  echo "Installing redshift..."
  sudo pacman -S redshift
  cp redshift.conf ~/.config/
fi

# These options are only for gnome.
if ask "Are you using gnome?"; then
  # Make titlebars smaller for gnome.
  if ask "Make titlebars smaller?"; then
    echo "Making titlebars smaller..."
    cp gtk.css ~/.config/gtk-3.0/gtk.css
  fi

  # These commands will install gnome shell extensions automatically.
  if ask "Install gnome extensions automatically?"; then
    yaourt gnome-shell-extension-installer
    # Frippery move clock:
    # https://extensions.gnome.org/extension/2/move-clock/
    gnome-shell-extension-installer 2
    # Topicons plus:
    # https://extensions.gnome.org/extension/1031/topicons/
    gnome-shell-extension-installer 1031
    # Top panel workspace scroll:
    # https://extensions.gnome.org/extension/701/top-panel-workspace-scroll/
    gnome-shell-extension-installer 701
    # Task bar:
    # https://extensions.gnome.org/extension/584/taskbar/
    gnome-shell-extension-installer 584
    # Task bar:
    # https://extensions.gnome.org/extension/484/workspace-grid/
    gnome-shell-extension-installer 484
    restart_gnome=true
  else
    echo "Please refer to the comments to install gnome extensions manually."
  fi
fi

# Install Google Chrome.
if ask "Install Google Chrome?"; then
  yaourt google-chrome
fi

# Restart gnome:
if [ "$restart_gnome" == "true" ]; then
  gnome-shell --replace &
fi

echo
echo "TODO(you):"
echo "1. Add redshift to list of startup application."
echo "2. :PluginInstall on vim."
echo "3. If gnome: Enable global dark theme in tweak tool."
