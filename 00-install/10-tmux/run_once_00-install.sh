#!/usr/bin/env bash

set -e

if [[ ! "$(command -v tmux)" ]]; then
    sudo apt-get install -y tmux
fi
