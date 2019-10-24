#!/usr/bin/env bash

__apt_install-packages () {
  sudo DEBIAN_FRONTEND=noninteractive apt-get install \
    --no-install-recommends \
    --verbose-versions \
    --show-upgraded \
    --quiet=2 \
    --yes \
    $(cat "$@")
}

__yarn_ensure-installed () {
  if [[ ! $(echo "$__YARN_INSTALLED" | grep "$@") ]]; then
    __yarn_ensure_installed "$@"
  fi
}
