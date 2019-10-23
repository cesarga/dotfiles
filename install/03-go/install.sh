#!/usr/bin/env bash

if [[ ! "$(command -v go)" ]]; then
    source "$HOME/.nix-profile/etc/profile.d/nix.sh"
    nix-env --install go
fi
