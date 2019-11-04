#!/usr/bin/env bash

if [[ ! $(cat /etc/apt/sources.list | grep stripe-cli-deb) ]]; then
  sudo apt-key adv --keyserver hkp://pool.sks-keyservers.net:80 --recv-keys 379CE192D401AB61
  echo "deb https://dl.bintray.com/stripe/stripe-cli-deb stable main" | sudo tee -a /etc/apt/sources.list
  sudo apt-get update
fi

# Install various tools
__apt_install-packages <<-EOF
	ack-grep
	agrep
	aria2
	bsdtar
	htop
	httpie
	imagemagick
	ipcalc
	jq
	lnav
	ncdu
	nnn
	progress
	s4cmd
	silversearcher-ag
	unrar
	unzip
	webp
	stripe
EOF

if noexists-exec 'dry'; then
  curl -sSf https://moncho.github.io/dry/dryup.sh | sudo sh
  sudo chmod 755 /usr/local/bin/dry
fi

# wharfee
# wego
# taskbook
# saws
# percol
# pacu
# lnav
# java
# fzf
# ddns
# composer
# aws
# ansible
# virtualenv python
# ffmpeg
# gflow
# weirdAAL
# howdoi
# s3cmd
# s4cmd
# speedtest-cli
# yq
# ripgrep
# mdcat
# carbon
# gcalcli
# jrnl
# transfer.sh
# tre
# the_platinum_searcher
# figlet
# pv
# pdd
