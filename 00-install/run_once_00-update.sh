#!/usr/bin/env bash

if [[ "$(command -v apt-get)" ]]; then
    sudo apt-get update
fi

if [[ "$(command -v nix-channel)" ]]; then
    nix-channel --update
fi
