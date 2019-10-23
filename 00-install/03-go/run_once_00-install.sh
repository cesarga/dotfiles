#!/usr/bin/env bash

if [[ ! "$(command -v go)" ]]; then
    nix-env --install go
fi
