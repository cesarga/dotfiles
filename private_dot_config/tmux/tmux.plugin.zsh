# Return if requirements are not found.
if ! (( $+commands[tmux] )); then
  return 1
fi


#
# Aliases
#

alias ta='tmux attach -t'
alias tad='tmux attach -d -t'
alias ts='tmux new-session -s'
alias tl='tmux list-sessions'
alias tksv='tmux kill-server'
alias tkss='tmux kill-session -t'


if [[ -z "$TMUX" ]]; then
    tmux -f "${XDG_CONFIG_HOME}/tmux/tmux.conf" start-server

    if ! tmux -f "${XDG_CONFIG_HOME}/tmux/tmux.conf" has-session 2> /dev/null; then
        exec tmux -f "${XDG_CONFIG_HOME}/tmux/tmux.conf" new-session -d
    else
        exec tmux -f "${XDG_CONFIG_HOME}/tmux/tmux.conf" attach-session -d
    fi
fi

