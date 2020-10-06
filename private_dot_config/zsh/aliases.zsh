alias refresh='source "$ZDOTDIR/.zshrc"'
alias reload='exec "$SHELL" -l'

alias cls='clear'

# please is a "sudo !!" alias
alias please='sudo $(fc -ln -1)'

alias ls='lsd -F --group-dirs first --size short'
alias la='lsd -lAhFr --group-dirs first --size short'
alias l='la --blocks permission,user,size,name'
alias lt='la --tree'

cd() {
    builtin cd "$@" || exit
    ls
}

alias mkdir='mkdir -p'

mkcdir() {
    mkdir -p -- "$1"&&
    builtin cd -P -- "$1" || exit
}

alias du="ncdu -rr -x --exclude .git --exclude node_modules --exclude vendor"

alias cat='bat --theme ansi-dark'

alias -- -='cd -'
alias .='l'
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias .....='cd ../../../..'
alias ......='cd ../../../../..'

alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'

alias df='df -h'

alias grep='grep --color=tty -d skip'

alias help='tldr'

alias wanip='dig +short myip.opendns.com @resolver1.opendns.com'
alias myip=wanip


# tm - create new tmux session, or switch to existing one. Works from within tmux too. (@bag-man)
# `tm` will allow you to select your tmux session via fzf.
# `tm irc` will attach to the irc session (if it exists), else it will create it.
tm() {
  local change;
  local session;
  [[ -n "$TMUX" ]] && change="switch-client" || change="attach-session"
  if [ "$1" ]; then
#    tmux $change -t "$1" 2>/dev/null || (tmux new-session -d -s $1 && tmux $change -t "$1"); return
    tmux $change -t "$1" 2>/dev/null || (tmux new-session -s "$1" && tmux $change -t "$1"); return
  fi
  session=$(tmux list-sessions -F "#{session_name}" 2>/dev/null | fzf --exit-0) &&  tmux $change -t "$session" || echo "No sessions found."
}


#
# z
#

[[ "$(alias z)" ]] && unalias z

z() {
  if [[ -z "$*" ]]; then
    cd "$(_z -l 2>&1 | fzf +s --tac | sed 's/^[0-9,.]* *//')" || exit
  else
    _last_z_args="$*"
    _z "$@"
  fi
}

### fzf

zz() {
  cd "$(_z -l 2>&1 | sed 's/^[0-9,.]* *//' | fzf -q "$_last_z_args")" || exit
}

# fif
fif() {
  if [ ! "$#" -gt 0 ]; then echo "Need a string to search for!"; return 1; fi
  rg --files-with-matches --no-messages "$1" | fzf --preview "highlight -O ansi -l {} 2> /dev/null | rg --colors 'match:bg:yellow' --ignore-case --pretty --context 10 '$1' || rg --ignore-case --pretty --context 10 '$1' {}"
}

