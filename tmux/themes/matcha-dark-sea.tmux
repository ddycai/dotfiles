# COLORS
#   PRIMARY: #2eb398
#   SECONDARY: #6699cc

## set status bar
set -g status-bg default
setw -g window-status-current-style bg="#282a2e",fg="#81a2be"

# message bar or "prompt"
set -g message-style bg="#2d2d2d",fg="#2eb398"

# right side of status bar holds "[host name] (date time)"
set -g status-right-length 100
#set -g status-right-style fg="black,bold"
set -g status-right '#{prefix_highlight} #[fg=#6699cc] %a %d %b %Y '

# make background window look like white tab
set-window-option -g window-status-style bg=default,fg=white,none
set-window-option -g window-status-format '#[fg=#6699cc,bg=colour235] #I #[fg=#999999,bg=#2d2d2d] #W #[default]'

# make foreground window look like bold yellow foreground tab
set-window-option -g window-status-current-format '#[fg=#2eb398,bg=#2d2d2d] #I #[fg=#cccccc,bg=#393939] #W #[default]'

# active terminal primary color border, non-active gray
set -g pane-border-style bg=default,fg="#999999"
set -g pane-active-border-style fg="#2eb398"
