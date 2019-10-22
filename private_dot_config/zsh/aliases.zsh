alias refresh='source "$ZDOTDIR/.zshrc"'
alias reload='exec "${SHELL}" -l'

alias cls='clear'

alias lc='ls -ACFv --group-directories-first --width=80'

cd() {
    builtin cd "$@" &&
    lc
}

alias mkdir='mkdir -p'

mkcdir() {
    mkdir -p -- "$1"&&
    builtin cd -P -- "$1"
}

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
