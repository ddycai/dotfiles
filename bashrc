alias ..='cd ..'
alias bashrc='vim ~/.bashrc'
alias vimrc='vim ~/.vimrc'

babel_watch() {
  babel --presets es2015 $1 --watch --progress -o $2
}
alias bw=babel_watch

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
