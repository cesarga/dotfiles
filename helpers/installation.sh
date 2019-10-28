#!/usr/bin/env bash

#
# Apt
#
__apt-get_updated-at_ISO () {
  /bin/ls -l --time-style=long-iso /var/cache/apt/pkgcache.bin | cut -d' ' -f6,7
}

__apt-get_updated-at () {
  date -d "$(__apt-get_updated-at_ISO)" +%s
}

__apt-get_updated-ago () {
  $(( $(date +%s) - $(__apt-get_updated-at) ))
}

__apt-get_needs-update () {
  (( 14400 < __apt-get_updated-ago ))
}

__apt_install-package () {
  if __apt-get_needs-update; then
      sudo apt-get update
  fi

  sudo DEBIAN_FRONTEND=noninteractive apt-get install \
    --no-install-recommends \
    --yes \
    -qq \
    "$@"
}

__apt_install-packages () {
  if __apt-get_needs-update; then
      sudo apt-get update
  fi

  sudo DEBIAN_FRONTEND=noninteractive apt-get install \
    --no-install-recommends \
    --yes \
    -qq \
    $(cat "$@")
}

#
# Nix
#
__nix-channel_updated-at_ISO () {
  nix-env --list-generations | grep current | cut -d' ' -f7,8
}

__nix-channel_updated-at () {
  date -d "$(__nix-channel_updated-at_ISO)" +%s
}

__nix-channel_updated-ago () {
  $(( $(date +%s) - $(__nix-channel_updated-at) ))
}

__nix-channel_needs-update () {
  (( 14400 < __nix-channel_updated-ago ))
}

__nix_install-package () {
  if __nix-channel_needs-update; then
      nix-channel --update
  fi

  nix-env --install \
    --quiet \
    --no-build-output \
    "$@"
}

__nix_install-packages () {
  if __nix-channel_needs-update; then
      nix-channel --update
  fi

  nix-env --install \
    --quiet \
    --no-build-output \
    $(cat "$@")
}

#
# Yarn
#
__yarn_ensure-installed () {
  if [[ ! $(echo "$__YARN_INSTALLED" | grep "$@") ]]; then
    yarn global add "$@"
  fi
}
