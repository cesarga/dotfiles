# shellcheck disable=SC2148
# shellcheck disable=SC1090

# load zgen
source "$ZDOTDIR/zgen/zgen.zsh"

# if the init scipt doesn't exist
if ! zgen saved; then
  echo "Creating a zgen save"

  zgen load zdharma/fast-syntax-highlighting
  zgen load zdharma/history-search-multi-word

  zgen load romkatv/powerlevel10k powerlevel10k

  zgen load leophys/zsh-plugin-fzf-finder
  zgen load rupa/z
  zgen load hlissner/zsh-autopair

  zgen zgen oh-my-zsh
  zgen oh-my-zsh plugins/colored-man-pages
  zgen oh-my-zsh plugins/common-aliases
  zgen oh-my-zsh plugins/git
  zgen oh-my-zsh plugins/git-flow
  zgen oh-my-zsh plugins/encode64
  zgen oh-my-zsh plugins/zsh-interactive-cd

  zgen load "${XDG_CONFIG_HOME}/tmux/tmux.plugin.zsh"

  zgen load https://github.com/docker/cli/blob/master/contrib/completion/zsh/_docker src
  zgen load zsh-users/zsh-history-substring-search
  zgen load zsh-users/zsh-completions src


  # plugins
#  zgen load zsh-users/zsh-syntax-highlighting

  # bulk load
#  zgen loadall <<EOPLUGINS
#    zsh-users/zsh-history-substring-search
#EOPLUGINS
  # ^ can't indent this EOPLUGINS

  # completions
#  zgen load zsh-users/zsh-completions src

  # theme
#  zgen oh-my-zsh themes/arrow


  # save all to init script
  zgen save
fi
