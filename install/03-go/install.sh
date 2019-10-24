#!/usr/bin/env bash

if noexists-exec 'go'; then
  nix-env --quiet --install go
fi

if exists-exec 'go'; then
  if noexists-exec 'tldr'; then
    go get github.com/isacikgoz/tldr/cmd/tldr
  fi
  if noexists-exec 'pup'; then
    go get github.com/ericchiang/pup
  fi
  if noexists-exec 'scenery'; then
    go get -u github.com/dmlittle/scenery
  fi
  if noexists-exec 'wego'; then
    go get -u github.com/schachmat/wego
  fi
fi
