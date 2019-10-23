#!/usr/bin/env bash

set -e

VERSION='3.7'
VERSION='3.7'

sudo apt-get install -y <<EOF
python${VERSION}
python3-pip
EOF

sudo update-alternatives --install \
    "$(command -v python3)" python3 \
    "$(command -v "python$VERSION")" 1

sudo update-alternatives --install \
    "$(command -v python)" python \
    "$(command -v "python3")" 1
