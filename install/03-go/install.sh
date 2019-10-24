#!/usr/bin/env bash

if noexists-exec 'go'; then
  nix-env --install go
fi
