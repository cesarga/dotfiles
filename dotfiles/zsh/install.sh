#!/usr/bin/env bash

if [[ ! "$(command -v zsh)" ]]; then
    sudo apt-get install -y zsh
    touch "$HOME/.zlogin"
fi

if [[ ! "$SHELL" == "$(command -v zsh)" ]]; then
  sudo chsh -s "$(command -v zsh)" "$USER"
fi

if [[ ! "$(command -v antigen)" ]]; then
  curl -L git.io/antigen > "$HOME/antigen.zsh"
fi
