alias mux=tmuxinator

muxi () {
  tmux kill-session -a
  tmuxinator sh
  tmuxinator selfhosted
  tmux kill-session -t 0 &>/dev/null
}
