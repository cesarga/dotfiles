#!/usr/bin/env bash

# rg
RIPGREP_VERSION="11.0.2"
RIPGREP_DIST_URL="https://github.com/BurntSushi/ripgrep/releases/download/${RIPGREP_VERSION}/ripgrep_${RIPGREP_VERSION}_amd64.deb"
RIPGREP_DST_DIR="/tmp/ripgrep"
RIPGREP_DST="$RIPGREP_DST_DIR/ripgrep_${RIPGREP_VERSION}_amd64.deb"

if [[ ! "$(command -v rg)" ]]; then
  wget -P "$RIPGREP_DST_DIR" "$RIPGREP_DIST_URL" &&
  sudo dpkg -i "$RIPGREP_DST" &&
  sudo rm -rf "$RIPGREP_DST_DIR"
fi

# fd
FD_VERSION="7.3.0"
FD_DIST_URL="https://github.com/sharkdp/fd/releases/download/v${FD_VERSION}/fd-musl_${FD_VERSION}_amd64.deb"
FD_DST_DIR="/tmp/fd"
FD_DST="$FD_DST_DIR/fd-musl_${FD_VERSION}_amd64.deb"

if [[ ! "$(command -v fd)" ]]; then
  wget -P "$FD_DST_DIR" "$FD_DIST_URL" &&
  sudo dpkg -i "$FD_DST" &&
  sudo rm -rf "$FD_DST_DIR"
fi

# fzf
FZF_VERSION="0.18.0"
FZF_DIST_URL="https://github.com/junegunn/fzf/archive/${FZF_VERSION}.tar.gz"
FZF_DST_DIR="$HOME/.fzf"

if [[ ! -f "$FZF_DST_DIR/bin/fzf" ]]; then
  (wget -qO- "$FZF_DIST_URL" | bsdtar -C "$HOME" -xvf -) &&
  cp -rfT "$HOME/fzf-$FZF_VERSION" "$FZF_DST_DIR" &&
  rm -rf "$HOME/fzf-$FZF_VERSION" &&
  "$FZF_DST_DIR/install" --bin --64 --key-bindings --completion --no-update-rc
fi

# lsd
LSD_VERSION="0.16.0"
LSD_DIST_URL="https://github.com/Peltoche/lsd/releases/download/${LSD_VERSION}/lsd-musl_${LSD_VERSION}_amd64.deb"
LSD_DST_DIR="/tmp/lsd"
LSD_DST="$LSD_DST_DIR/lsd-musl_${LSD_VERSION}_amd64.deb"

if [[ ! "$(command -v lsd)" ]]; then
  wget -P "$LSD_DST_DIR" "$LSD_DIST_URL" &&
  sudo dpkg --force-all -i "$LSD_DST" &&
  sudo rm -rf "$LSD_DST_DIR"
fi

# bat
BAT_VERSION="0.11.0"
BAT_DIST_URL="https://github.com/sharkdp/bat/releases/download/v${BAT_VERSION}/bat-musl_${BAT_VERSION}_amd64.deb"
BAT_DST_DIR="/tmp/bat"
BAT_DST="$BAT_DST_DIR/bat-musl_${BAT_VERSION}_amd64.deb"

if [[ ! "$(command -v bat)" ]]; then
  wget -P "$BAT_DST_DIR" "$BAT_DIST_URL" &&
  sudo dpkg --force-all -i "$BAT_DST" &&
  sudo rm -rf "$BAT_DST_DIR"
fi

if [[ ! "$(command -v ncdu)" ]]; then
  sudo apt-get install -y ncdu
fi
