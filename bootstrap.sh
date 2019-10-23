#!/usr/bin/env bash

# NOT IMPLEMENTED

set -ex

if [[ ! "$(command -v chezmoi)" ]]; then
    curl -sfL https://git.io/chezmoi | sudo BINDIR=/usr/local/bin sh
fi

chezmoi init https://github.com/cesarga/dotfiles.git
#chezmoi source -- submodule update --init --recursive

curl -s -L -o /tmp/tpm-master.tar.gz https://github.com/tmux-plugins/tpm/archive/master.tar.gz
chezmoi import --strip-components 1 --destination "$HOME/libs/tpm" /tmp/tpm-master.tar.gz

curl -s -L -o /tmp/zplugin-v2.3.tar.gz https://github.com/zdharma/zplugin/archive/v2.3.tar.gz
chezmoi import --strip-components 1 --destination "$HOME/libs/zplugin/bin" /tmp/zplugin-v2.3.tar.gz

chezmoi apply
