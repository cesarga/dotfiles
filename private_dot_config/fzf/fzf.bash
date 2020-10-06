# Setup fzf
# ---------
if [[ ! "$PATH" == */usr/bin* ]]; then
  export PATH="${PATH:+${PATH}:}/usr/bin"
fi

# Auto-completion
# ---------------
#[[ $- == *i* ]] && source "/home/cesar/.fzf/shell/completion.bash" 2> /dev/null

# Key bindings
# ------------
#source "/home/cesar/.fzf/shell/key-bindings.bash"
