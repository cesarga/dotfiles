#!/usr/bin/env bash

# Docker
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
   $(lsb_release -cs) \
   stable"

# php
sudo LC_ALL=C.UTF-8 add-apt-repository -y ppa:ondrej/php

# Yarn
curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add -
echo "deb https://dl.yarnpkg.com/debian/ stable main" | sudo tee /etc/apt/sources.list.d/yarn.list

# Update
sudo apt-get update

# Install
sudo apt-get install -y $(cat "$HOME/.dotfiles/dotfiles/apt/installed")
