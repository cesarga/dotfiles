#!/usr/bin/env bash

if [[ "$(command -v apt-get)" ]]; then
    sudo apt-get update
else
    echo 'apt-get in not installed'
    exit 1;
fi

if [[ "$(command -v nix-channel)" ]]; then
    nix-channel --update
fi
