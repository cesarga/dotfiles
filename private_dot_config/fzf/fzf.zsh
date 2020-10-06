# Setup fzf
# ---------
if [[ ! "$PATH" == */usr/bin* ]]; then
  export PATH="${PATH:+${PATH}:}/usr/bin"
fi

# Auto-completion
# ---------------
#[[ $- == *i* ]] && source "$HOME/.fzf/shell/completion.zsh" 2> /dev/null

# Key bindings
# ------------
#source "$HOME/.fzf/shell/key-bindings.zsh"
