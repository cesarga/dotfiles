#!/usr/bin/env bash

if [[ noexists-exec 'nix-env' ]]; then
  sudo install -d -m755 -o $(id -u) -g $(id -g) /nix
  curl https://nixos.org/nix/install | sh
  source "$HOME/.nix-profile/etc/profile.d/nix.sh"
  nix-channel --add https://nixos.org/channels/nixpkgs-unstable
  nix-channel --update
fi
