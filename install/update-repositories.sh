#!/usr/bin/env bash

if exists-exec 'apt-get'; then
  sudo apt-get update
else
  echo 'apt-get in not installed'
  exit 1;
fi

if exists-exec 'nix-env'; then
  nix-channel --update
fi
