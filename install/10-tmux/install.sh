#!/usr/bin/env bash

if ! exists-file '/usr/local/share/zsh/site-functions/_tmuxinator'; then
  sudo wget https://raw.githubusercontent.com/tmuxinator/tmuxinator/master/completion/tmuxinator.zsh -O /usr/local/share/zsh/site-functions/_tmuxinator
fi
