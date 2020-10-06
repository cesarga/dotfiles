alias mux=tmuxinator

muxi () {
  tmux kill-session -a
  tmuxinator loc
  tmuxinator sh
  tmux kill-session -t 0 &>/dev/null
}
