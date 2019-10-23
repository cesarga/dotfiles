#!/usr/bin/env bash

if [[ ! "$(command -v tmux)" ]]; then
  sudo apt-get install -y tmux
fi
