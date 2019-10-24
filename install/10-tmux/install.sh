#!/usr/bin/env bash

if noexists-exec 'tmux'; then
  sudo apt-get install -y tmux
  apt-install-packages <<-EOF
    tmux
	EOF
fi
