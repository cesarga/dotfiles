#!/usr/bin/env bash

#
# Node 12
#
if noexists-exec 'node'; then
  curl -sL https://deb.nodesource.com/setup_12.x | sudo -E bash -
  apt-install-packages <<-EOF
    nodejs
	EOF
fi


#
# Yarn
#
if noexists-exec 'yarn'; then
  curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add -
    echo "deb https://dl.yarnpkg.com/debian/ stable main" | sudo tee /etc/apt/sources.list.d/yarn.list
    sudo apt-get update
    sudo apt-get install -y yarn
    apt-install-packages <<-EOF
			yarn
		EOF
fi
