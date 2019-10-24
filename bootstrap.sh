#!/usr/bin/env bash

# NOT IMPLEMENTED

set -ex

if [[ ! "$(command -v chezmoi)" ]]; then
    curl -sfL https://git.io/chezmoi | sudo BINDIR=/usr/local/bin sh
fi

chezmoi init https://github.com/cesarga/dotfiles.git

# weasel-pageant
if [[ ! -d /wsl2/libs/weasel-pageant ]]; then
  sudo install -d -m755 -o $(id -u) -g $(id -g) /wsl2/libs/weasel-pageant
fi

if [[ ! -d "$HOME/libs" ]]; then
  mkdir -p "$HOME/libs"
fi

if [[ ! -h "$HOME/libs/weasel-pageant" ]]; then
  ln -s /wsl2/libs/weasel-pageant "$HOME/libs/weasel-pageant"
fi

sudo apt-get install unzip -y --no-install-recommends -qq
TMPDIR=$(mktemp -d)
curl -s -L -o /tmp/weasel-pageant-1.4.zip https://github.com/vuori/weasel-pageant/releases/download/v1.4/weasel-pageant-1.4.zip
unzip -q /tmp/weasel-pageant-1.4.zip -d "$TMPDIR"
chmod -R +r "$TMPDIR"
tar -c -z -f /tmp/weasel-pageant-1.4.tar.gz "$TMPDIR"
chezmoi import --strip-components 2 --destination "$HOME/libs/weasel-pageant" /tmp/weasel-pageant-1.4.tar.gz


# tpm
curl -s -L -o /tmp/tpm-master.tar.gz https://github.com/tmux-plugins/tpm/archive/master.tar.gz
chezmoi import --strip-components 1 --destination "$HOME/libs/tpm" /tmp/tpm-master.tar.gz


# zplugin
curl -s -L -o /tmp/zplugin-v2.3.tar.gz https://github.com/zdharma/zplugin/archive/v2.3.tar.gz
chezmoi import --strip-components 1 --destination "$HOME/libs/zplugin/bin" /tmp/zplugin-v2.3.tar.gz


chezmoi apply
