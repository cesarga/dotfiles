#!/usr/bin/env bash

if [[ ! "$(command -v nix-env)" ]]; then
    sudo install -d -m755 -o $(id -u) -g $(id -g) /nix
    curl https://nixos.org/nix/install | sh
fi
