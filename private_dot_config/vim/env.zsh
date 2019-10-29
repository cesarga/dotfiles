if [[ "$(command -v nvim)" ]]; then
  ED="$(command -v nvim)"
elif [[ "$(command -v vim)" ]]; then
  ED="$(command -v vim)"
elif [[ "$(command -v nano)" ]]; then
  ED="$(command -v nano)"
fi

export VISUAL="${ED}"
export EDITOR="$VISUAL"
