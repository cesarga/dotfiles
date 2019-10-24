#!/usr/bin/env bash

apt-install-packages () {
  sudo DEBIAN_FRONTEND=noninteractive apt-get install \
    --no-install-recommends \
    --verbose-versions \
    --show-upgraded \
    --quiet \
    --yes \
    $(cat "$@")
}
