#!/usr/bin/env bash

set -e

VERSION='3.7'

sudo DEBIAN_FRONTEND=noninteractive apt-get install -y $(cat <<EOF
python${VERSION}
python3-pip
EOF
)

if [[ "$(command -v python3)" ]]; then
    sudo update-alternatives --install "$(command -v python3)" python3 "$(command -v "python$VERSION")" 1
fi

if [[ "$(command -v python)" ]]; then
    sudo update-alternatives --install "$(command -v python)" python "$(command -v "python$VERSION")" 1
fi
