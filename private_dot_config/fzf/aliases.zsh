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
