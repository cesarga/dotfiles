#!/usr/bin/env bash

if exists-exec 'zsh'; then
  if [[ ! "${SHELL}" == "$(command -v zsh)" ]]; then
    sudo chsh -s "$(command -v zsh)" "${USER}"
  fi
fi
