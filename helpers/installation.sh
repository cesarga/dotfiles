#!/usr/bin/env bash

__apt_install-packages () {
  sudo DEBIAN_FRONTEND=noninteractive apt-get install \
    --no-install-recommends \
    --yes \
    -qq \
    $(cat "$@")
}

__yarn_ensure-installed () {
  if [[ ! $(echo "$__YARN_INSTALLED" | grep "$@") ]]; then
    yarn global add "$@"
  fi
}
