#!/usr/bin/env bash

# NOT IMPLEMENTED

set -ex

if [[ ! "$(command -v chezmoi)" ]]; then
    curl -sfL https://git.io/chezmoi | sudo BINDIR=/usr/local/bin sh
fi

chezmoi init https://github.com/cesarga/dotfiles.git

# tpm
curl -s -L -o /tmp/tpm-master.tar.gz https://github.com/tmux-plugins/tpm/archive/master.tar.gz
chezmoi import --strip-components 1 --destination "$HOME/libs/tpm" /tmp/tpm-master.tar.gz

# zplugin
curl -s -L -o /tmp/zplugin-v2.3.tar.gz https://github.com/zdharma/zplugin/archive/v2.3.tar.gz
chezmoi import --strip-components 1 --destination "$HOME/libs/zplugin/bin" /tmp/zplugin-v2.3.tar.gz

# weasel-pageant
if [[ -d /wsl2/libs/weasel-pageant ]]; then
    mkdir -p /wsl2/libs/weasel-pageant
fi
if [[ -h "$HOME/libs/weasel-pageant" ]]; then
    ln -s /wsl2/libs/weasel-pageant "$HOME/libs/weasel-pageant"
fi
curl -s -L -o /tmp/weasel-pageant-1.4.tar.gz https://github.com/vuori/weasel-pageant/releases/download/v1.4/weasel-pageant-1.4.zip
chezmoi import --strip-components 1 --destination "$HOME/libs/weasel-pageant" /tmp/weasel-pageant-1.4.zip


chezmoi apply
