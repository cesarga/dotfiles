#!/usr/bin/env bash

# Yarn
curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add -
echo "deb https://dl.yarnpkg.com/debian/ stable main" | sudo tee /etc/apt/sources.list.d/yarn.list

# Update
sudo apt-get update

# Install
sudo apt-get install -y <<EOF
apt-transport-https
ack-grep
aria2
autoconf
automake
bsdtar
ca-certificates
cmake
containerd.io
curl
daemonize
gnupg-agent
htop
httpie
ipcalc
jq
lnav
make
nnn
s4cmd
silversearcher-ag
socat
software-properties-common
unrar
unzip
xclip
EOF
