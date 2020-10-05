#!/usr/bin/env bash

if ! exists-exec /usr/bin/docker; then
  curl -fsSL https://get.docker.com | sudo sh

  # Add the current user to the `docker` group to execute Docker commands without sudo
  sudo usermod -aG docker "$USER"
fi
