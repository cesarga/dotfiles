#!/usr/bin/env bash

# NOT IMPLEMENTED

set -ex

if [[ ! "$(command -v chezmoi)" ]]; then
    curl -sfL https://git.io/chezmoi | sudo BINDIR=/usr/local/bin sh
fi

chezmoi init https://github.com/cesarga/dotfiles.git
chezmoi source -- submodule update --init --recursive
chezmoi apply
