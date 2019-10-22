#!/usr/bin/env bash

#curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
#sudo add-apt-repository \
#   "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
#   $(lsb_release -cs) \
#   stable"
#
#sudo apt-get update

if [[ ! "$(command -v docker)" ]]; then
    curl -fsSL https://get.docker.com | sudo sh
#    sudo usermod -aG docker "$USER"
fi
