#!/usr/bin/env bash

if [[ ! "$(grep XDG /etc/zsh/zshenv)" ]]; then

  if [[ ! -d /etc/zsh ]]; then
    sudo mkdir -p /etc/zsh
  fi

cat <<-EOF | sudo tee /etc/zsh/zshenv
		# Path
		export PATH="\${HOME}/bin:/usr/local/bin:/usr/bin/:/bin:\${PATH}"

		# XDG base directories
		export XDG_DATA_HOME="\${HOME}/.local/share"
		export XDG_CONFIG_HOME="\${HOME}/.config"
		export XDG_CACHE_HOME="\${HOME}/.cache"
		export XDG_CACHE_HOME="\${HOME}/.cache"
		export XDG_RUNTIME_DIR=

		export XDG_CONFIG_DIRS="/etc/xdg"
		export XDG_DATA_DIRS="/usr/local/share/:/usr/share/"

		# zsh
		export ZDOTDIR="\${XDG_CONFIG_HOME}/zsh"
	EOF
fi

if noexists-exec 'zsh'; then
#  sudo apt-get -y -o Dpkg::Options::=--force-confdef -o Dpkg::Options::=--force-confold install zsh
    __apt_install-packages <<-EOF
			-o Dpkg::Options::=--force-confdef -o Dpkg::Options::=--force-confold
			zsh
		EOF
fi

if exists-exec 'zsh'; then
  if [[ ! "${SHELL}" == "$(command -v zsh)" ]]; then
    sudo chsh -s "$(command -v zsh)" "${USER}"
  fi
fi
