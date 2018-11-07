#!/bin/bash
# Script for setting up antergos the way I like it.

DIR="${BASH_SOURCE%/*}"
. "$DIR/common.sh"

is_gnome=false
restart_gnome=false

# ==================== Setup ====================
if ask "Run dotfiles install script?"; then
  bash "$DIR/install.sh"
fi

if ask "(For Windows dual boot) Change hardware clock standard to localtime?"; then
  timedatectl set-local-rtc 1
fi

# Update grub.
if ask "Update grub? (if Windows is not in grub)"; then
  echo "Updating grub..."
  sudo grub-mkconfig -o /boot/grub/grub.cfg
fi

# Set up your git username and email.
if ask "Set up your git username and email?"; then
  read -p 'Enter your git name: ' gitname
  git config --global user.name "$gitname"
  read -p 'Enter your git email: ' gitemail
  git config --global user.email "$gitemail"
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
if ask "Install vim-plug?"; then
  curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
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

# These options are only for cinnamon.
if ask "Are you using cinnamon?"; then
  if ask "Install numix-cinnamon-dark theme?"; then
    yaourt numix-cinnamon-dark
  fi
fi

# Install Google Chrome.
if ask "Install Google Chrome?"; then
  yaourt google-chrome
fi

if ask "Install Asian fonts and emojis?"; then
  sudo pacman -S adobe-source-han-sans-otc-fonts
  sudo pacman -S noto-fonts-emoji
fi

if ask 'Install xf86-input-libinput (for mouse accel)?'; then
  sudo pacman -S xf86-input-libinput
fi

# Restart gnome:
if [ "$restart_gnome" == "true" ]; then
  gnome-shell --replace &
fi

echo
echo "TODO(you):"
echo "1. Add redshift to list of startup application."
echo "2. :PlugInstall on vim."
echo "3. If gnome: Enable global dark theme in tweak tool."
