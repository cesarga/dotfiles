#!/usr/bin/env bash

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
	kubectl
	lnav
	ncdu
	nnn
	pet
	progress
	s4cmd
	silversearcher-ag
	unrar
	unzip
	webp
EOF
