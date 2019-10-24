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
	lnav
	ncdu
	nnn
	progress
	s4cmd
	silversearcher-ag
	unrar
	unzip
	webp
EOF

#kubectl
#pet
