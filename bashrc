#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
PS1='[\u@\h \W]\$ '
BROWSER=/usr/bin/google-chrome-stable
EDITOR=/usr/bin/vim

alias ..='cd ..'
alias bashrc='vim ~/.bashrc'
alias vimrc='vim ~/.vimrc'
alias q='exit'

# Git shortcuts
alias gp='git status'         # git pending
alias gy='git pull'           # git sync
alias gc='git commit'         # git commit
alias ga='git commit --amend' # git amend
alias gl='git add --all .'    # git add all

if [ -e /usr/share/terminfo/x/xterm-256color ]; then
        export TERM='xterm-256color'
else
        export TERM='xterm-color'
fi

# export PS1="\W$ "
