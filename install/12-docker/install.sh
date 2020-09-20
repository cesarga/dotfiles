#!/usr/bin/env bash

if ! exists-exec /usr/bin/docker; then
  curl -fsSL https://get.docker.com | sudo sh

  # Add the current user to the `docker` group to execute Docker commands without sudo
  sudo usermod -aG docker "$USER"
fi

#if [[ ! "$(command -v socat)" ]]; then
#  sudo apt-get install -y socat
#  __apt_install-packages <<-EOF
#		socat
#	EOF
#fi
