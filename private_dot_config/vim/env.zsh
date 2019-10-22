if [[ "$(command -v nvim)" ]]; then
    export VISUAL="$(command -v nvim)"
    export EDITOR="${VISUAL}"
fi
