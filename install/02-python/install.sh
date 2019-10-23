#!/usr/bin/env bash

VERSION='3.7'

if [[ ! "$(command -v python3.7)" ]]; then

  # Install python3 and pip using apt
  sudo DEBIAN_FRONTEND=noninteractive apt-get install -y $(cat <<-EOF
		python${VERSION}
		python3-pip
	EOF
)

  # Update alternatives for python3 and `python` binaries
  if [[ "$(command -v python3)" ]]; then
      sudo update-alternatives --install "$(command -v python3)" python3 "$(command -v "python$VERSION")" 1
  fi

  if [[ "$(command -v python)" ]]; then
      sudo update-alternatives --install "$(command -v python)" python "$(command -v "python$VERSION")" 1
  fi

  # Fix missing `apt_pkg` error when running `apt-get update`
  sudo apt-get remove -y python3-apt
  sudo apt-get install -y python3-apt
fi
