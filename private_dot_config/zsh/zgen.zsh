# shellcheck disable=SC2148
# shellcheck disable=SC1090

# load zgen
source "$ZDOTDIR/zgen/zgen.zsh"

# if the init scipt doesn't exist
if ! zgen saved; then
  echo "Creating a zgen save"

  zgen oh-my-zsh

  # plugins
  zgen oh-my-zsh plugins/git
  zgen oh-my-zsh plugins/sudo
  zgen oh-my-zsh plugins/command-not-found
  zgen load zsh-users/zsh-syntax-highlighting

  # bulk load
  zgen loadall <<EOPLUGINS
    zsh-users/zsh-history-substring-search
EOPLUGINS
  # ^ can't indent this EOPLUGINS

  # completions
  zgen load zsh-users/zsh-completions src

  # theme
  zgen oh-my-zsh themes/arrow

  zgen load romkatv/powerlevel10k powerlevel10k

  # save all to init script
  zgen save
fi
