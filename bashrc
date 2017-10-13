# ========================
# start frigidrain .bashrc
# ========================

BROWSER=/usr/bin/google-chrome-stable
EDITOR=/usr/bin/vim
PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '

alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias bashrc='vim ~/.bashrc'
alias sb='source ~/.bashrc'
alias vimrc='vim ~/.vimrc'
alias q='exit'
alias gnome-restart='gnome-shell --replace&'

# Opens files in :vsplit.
vsplit() {
  vim -O "$@"
}

# Opens files in :hsplit.
hsplit() {
  vim -o "$@"
}

# Git shortcuts
alias gp='git status'         # pending
alias gy='git pull'           # sync
alias gc='git commit'
alias ga='git commit --amend' # amend
alias gl='git add --all .'    # add all

if [ -e /usr/share/terminfo/x/xterm-256color ]; then
        export TERM='xterm-256color'
else
        export TERM='xterm-color'
fi
