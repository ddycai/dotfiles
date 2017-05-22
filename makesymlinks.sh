#!/bin/bash
############################
# make.sh
# This script creates symlinks from the home directory to any desired dotfiles in ~/dotfiles
# Branched from https://github.com/michaeljsmalley/dotfiles/blob/master/makesymlinks.sh 
############################

########## Variables

dir=~/dotfiles                    # dotfiles directory
olddir=~/dotfiles_old             # old dotfiles backup directory
files="bashrc vimrc tmux.conf jshintrc"    # list of files/folders to symlink in homedir

##########

# create dotfiles_old in homedir
echo "Creating $olddir for backup of any existing dotfiles in ~"
mkdir -p $olddir

# change to the dotfiles directory
echo "Changing to the $dir directory"
cd $dir

# move any existing dotfiles in homedir to dotfiles_old directory, then create symlinks 
for file in $files; do
    echo "Backup and creating symlink to $file in home directory."
    mv ~/.$file ~/dotfiles_old/
    ln -s $dir/$file ~/.$file
done
