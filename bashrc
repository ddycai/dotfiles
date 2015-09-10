PATH=$PATH:~/.composer/vendor/bin
export PATH

alias ..='cd ..'
alias bashrc='vim ~/.bashrc'
alias vimrc='vim ~/.vimrc'

# Git shortcuts
alias gp='git status'         # git pending
alias gy='git pull'           # git sync
alias gc='git commit'         # git commit
alias gm='git commit --amend' # git amend
alias ga='git add --all .'    # git add all

# INFINALITY FONT RENDERING CONFIG
. /etc/infinality-settings.sh

export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting
[[ -s "$HOME/.rvm/scripts/rvm" ]] && . "$HOME/.rvm/scripts/rvm"

if [ -e /usr/share/terminfo/x/xterm-256color ]; then
        export TERM='xterm-256color'
else
        export TERM='xterm-color'
fi

export PS1="\W$ "
