#!/usr/bin/env bash

if [[ ! "$(command -v go)" ]]; then
    source ../../helpers/ensure-nix.sh && ensure-nix
    nix-env --install go
fi
