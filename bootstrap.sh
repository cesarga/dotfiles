#!/usr/bin/env bash

# NOT IMPLEMENTED

set -ex

if [[ ! "$(command -v chezmoi)" ]]; then
  curl -sfL https://git.io/chezmoi | sudo BINDIR=/usr/local/bin sh
fi

/usr/local/bin/chezmoi init https://github.com/cesarga/dotfiles.git
#mkdir -p "$HOME/.local/share/chezmoi"
#sudo mount -o bind /z/dev/projects/dotfiles/ubuntu-20.04/ "$HOME/.local/share/chezmoi"

# weasel-pageant
#curl -s -L -o /tmp/weasel-pageant-1.4.tar.gz https://raw.githubusercontent.com/cesarga/dotfiles/master/exports/weasel-pageant-1.4.tar.gz
#chezmoi import --strip-components 1 --destination "$HOME/libs/weasel-pageant" /tmp/weasel-pageant-1.4.tar.gz

# tpm
curl -s -L -o /tmp/tpm-master.tar.gz https://github.com/tmux-plugins/tpm/archive/master.tar.gz
/usr/local/bin/chezmoi import --strip-components 1 --destination "$HOME/libs/tpm"  /tmp/tpm-master.tar.gz

/usr/local/bin/chezmoi apply
