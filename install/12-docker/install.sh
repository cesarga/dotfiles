#!/usr/bin/env bash

if [[ ! "$(command -v docker)" ]]; then
  curl -fsSL https://get.docker.com | sudo sh

  # Add the current user to the `docker` group to execute Docker commands without sudo
  sudo usermod -aG docker "$USER"
fi

#if [[ ! "$(command -v npiperelay.exe)" ]]; then
#  WINUSER=cesar
#  go get -d github.com/jstarks/npiperelay
#  GOOS=windows go build -o "/c/Users/$WINUSER/go/bin/npiperelay.exe" github.com/jstarks/npiperelay
#  sudo ln -s "/mnt/c/Users/$WINUSER/go/bin/npiperelay.exe" /usr/local/bin/npiperelay.exe
#fi

if [[ ! "$(command -v socat)" ]]; then
  sudo apt-get install -y socat
fi
