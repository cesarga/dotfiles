#!/usr/bin/env bash

# Install various tools
apt-install-packages <<-EOF
  ack-grep
  aria2
  bsdtar
  htop
  httpie
  ipcalc
  jq
  lnav
  nnn
  s4cmd
  silversearcher-ag
  unrar
  unzip
EOF
