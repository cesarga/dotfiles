#!/usr/bin/env bash

if ! exists-exec 'nix-env'; then
  sudo install -d -m755 -o "$(id -u)" -g "$(id -g)" /nix
  curl -L https://nixos.org/nix/install | sh >/dev/null 2>&1
  # shellcheck disable=SC1090
  source "$HOME/.nix-profile/etc/profile.d/nix.sh"
  nix-channel --add https://nixos.org/channels/nixpkgs-unstable
  nix-channel --update
fi
