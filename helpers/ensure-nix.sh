#!/usr/bin/env bash

set -e

ensure-nix() {
    if [[ -f "$HOME/.nix-profile/etc/profile.d/nix.sh" ]]; then
        source "$HOME/.nix-profile/etc/profile.d/nix.sh"
    else
        exit 1
    fi
}

export -f ensure-nix
