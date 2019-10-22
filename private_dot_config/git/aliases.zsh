alias gs='git status'
alias gd='git diff'
alias gp='git pull'
alias gb='git rev-parse --abbrev-ref HEAD'
alias gt='git describe --tags'

function gf() {
  git add . \
    && git commit -m "$@" \
    && git push origin "$(gb)"
}

function gm() {
  git merge "$1"
}

function gc() {
  git checkout "$1" && gp
}
