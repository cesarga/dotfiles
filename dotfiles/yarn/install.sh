#!/usr/bin/env bash

if [[ ! "$(command -v node)" ]]; then
  curl -sL https://deb.nodesource.com/setup_11.x | sudo -E bash -
  sudo apt-get install -y nodejs
fi

if [[ ! "$(command -v yarn)" ]]; then
  curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add -
  echo "deb https://dl.yarnpkg.com/debian/ stable main" | sudo tee /etc/apt/sources.list.d/yarn.list

  sudo apt-get update && sudo apt-get install --no-install-recommends yarn -y
fi
