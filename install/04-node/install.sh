#!/usr/bin/env bash

#
# Node 12
#
if noexists-exec 'node'; then
  curl -sL https://deb.nodesource.com/setup_12.x | sudo -E bash -
  __apt_install-packages <<-EOF
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
  __apt_install-packages <<-EOF
		yarn
	EOF
fi

if exists-exec 'yarn'; then
  export __YARN_INSTALLED="$(yarn global list)"

  __yarn_ensure-installed 'binci'
  __yarn_ensure-installed 'firebase-tools'
  __yarn_ensure-installed 'fx'
  __yarn_ensure-installed 'gatsby-cli'
#  __yarn_ensure-installed 'generator-node'
  __yarn_ensure-installed 'gh-pages'
  __yarn_ensure-installed 'gulp'
  __yarn_ensure-installed 'korkut'
#  __yarn_ensure-installed 'qoa'
  __yarn_ensure-installed 'shuji'
  __yarn_ensure-installed 'taskbook'
  __yarn_ensure-installed 'yo'
fi
