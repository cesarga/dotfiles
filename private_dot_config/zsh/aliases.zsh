alias refresh='source "$ZDOTDIR/.zshrc"'
alias reload='exec "$SHELL" -l'

alias cls='clear'

alias ls='lsd -F --group-dirs first --size short'
alias la='lsd -lAhFr --group-dirs first --size short'
alias l='la --blocks permission,user,size,name'
alias lt='la --tree'

cd() {
    builtin cd "$@" &&
    ls
}

alias mkdir='mkdir -p'

mkcdir() {
    mkdir -p -- "$1"&&
    builtin cd -P -- "$1"
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


#
# fzf
#
# Use fd (https://github.com/sharkdp/fd) instead of the default find
# command for listing path candidates.
# - The first argument to the function ($1) is the base path to start traversal
# - See the source code (completion.{bash,zsh}) for the details.
#

_fzf_compgen_path() {
  fd --hidden --follow --exclude ".git" --exclude "node_modules" --exclude "vendor" . "$1"
}

_fzf_compgen_dir() {
  fd --type d --hidden --follow --exclude ".git" --exclude "node_modules" --exclude "vendor" . "$1"
}


#
# z
#

[[ "$(alias z)" ]] && unalias z

z() {
  if [[ -z "$*" ]]; then
    cd "$(_z -l 2>&1 | fzf +s --tac | sed 's/^[0-9,.]* *//')"
  else
    _last_z_args="$@"
    _z "$@"
  fi
}

zz() {
  cd "$(_z -l 2>&1 | sed 's/^[0-9,.]* *//' | fzf -q "$_last_z_args")"
}
