# Setup fzf
# ---------
if [[ ! "$PATH" == */home/cesar/.fzf/bin* ]]; then
  export PATH="${PATH:+${PATH}:}/home/cesar/.fzf/bin"
fi

# Auto-completion
# ---------------
[[ $- == *i* ]] && source "/home/cesar/.fzf/shell/completion.bash" 2> /dev/null

# Key bindings
# ------------
source "/home/cesar/.fzf/shell/key-bindings.bash"
