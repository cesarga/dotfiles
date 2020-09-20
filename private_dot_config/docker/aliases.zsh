alias d='docker'
alias dc='docker-compose'

alias up='dc up -d'
alias down='dc down'
alias de='dc exec'

deb() {
  if [[ $# -ne 1 ]]; then
    echo "Usage: "$FUNCNAME" CONTAINER_ID"
    return 1
  fi

  de "${1}" bash -l
}

alias dclogs='dc logs -ft'
alias dcrun='dc run --rm'
alias work='de --user devilbox php bash -l'

alias dclimg='docker rmi $(docker images --filter "dangling=true" -q --no-trunc)'

alias docker-nginx='docker run --rm -v "$PWD:/usr/share/nginx/html:ro" -p 80:80 nginx'
