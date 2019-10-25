# Disable prompt wizard
POWERLEVEL9K_DISABLE_CONFIGURATION_WIZARD=true

# Zsh syntax highliter
export ZSH_HIGHLIGHT_HIGHLIGHTERS=(main brackets)

# Zsh autosuggest
typeset -ga ZSH_AUTOSUGGEST_EXECUTE_WIDGETS
export ZSH_AUTOSUGGEST_ACCEPT_WIDGETS=(
  end-of-line
  vi-forward-char
  vi-end-of-line
  vi-add-eol
)

 # makes color constants available
autoload -U colors
colors

# enable colored output from ls, etc. on FreeBSD-based systems
export CLICOLOR=1

# dircolors
[[ -f "$HOME/.dircolors" ]] &&  eval "$(dircolors "$HOME/.dircolors")"

# source powerlevel10k config
source "$ZDOTDIR/p10k.zsh"
