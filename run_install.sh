#!/usr/bin/env bash
# shellcheck disable=SC1090

export LOG_LEVEL='NOTICE'
export LOG_CMD_QUIET=1
source "$(chezmoi source-path)/helpers/base.bash"

function sourceFiles () {
  local DIR="$1";
  shift;
  for sourced_file in $(find "$(chezmoi source-path)/$DIR" -type f -name "$@" | sort); do
    log DEBUG "Sourcing ${sourced_file}"
    log_cmd source "${sourced_file}"
  done
}

function collectFiles () {
  local DIR="$1";
  shift;
  for collected_file in $(find "$(chezmoi source-path)/$DIR" -type f -name "$@" | sort); do
    local COLLECTED
    log DEBUG "Collecting ${collected_file}"
    mapfile -t COLLECTED_CURRENT < <(cat "$collected_file")
    COLLECTED=("${COLLECTED[@]}" "${COLLECTED_CURRENT[@]}")
  done
  echo "${COLLECTED[@]}"
}

#
# Global helpers
#
sourceFiles 'helpers' '*.sh'

#
# apt sources
#
log NOTICE 'Adding apt sources'
export SOURCES_LIST="/etc/apt/sources.list"
sourceFiles 'install' 'sources.sh'

log NOTICE 'Updating apt sources'
sudo apt-get update | log DEBUG

#
# Pre-install scripts
#
log NOTICE 'Executing pre-install scripts'
sourceFiles 'install' 'pre.sh'

#
# apt install
#
log NOTICE 'Collecting apt packages'
IFS=" " read -r -a APT_PACKAGES <<< "$(collectFiles 'install' 'apt.list')"

log NOTICE 'Installing apt packages'
log DEBUG "${APT_PACKAGES[@]}"
log_cmd sudo DEBIAN_FRONTEND=noninteractive apt-get install \
  --no-install-recommends \
  --yes \
  --option Dpkg::Options::=--force-confdef \
  --option Dpkg::Options::=--force-confold \
  "${APT_PACKAGES[@]}"

#
# apt upgrade
#
log NOTICE 'Upgrading apt packages'
log_cmd sudo DEBIAN_FRONTEND=noninteractive apt-get upgrade \
  --no-install-recommends \
  --yes \
  --option Dpkg::Options::=--force-confdef \
  --option Dpkg::Options::=--force-confold

#
# Install scripts
#
log NOTICE 'Executing install scripts'
sourceFiles 'install' 'install.sh'

#
# Post-install scripts
#
log NOTICE 'Executing post-install scripts'
sourceFiles 'install' 'post.sh'

#
# nix packages
#
log NOTICE 'Collecting nix packages'
IFS=" " read -r -a NIX_PACKAGES <<< "$(collectFiles 'install' 'nix.list')"

log NOTICE 'Installing nix packages'
log DEBUG "${NIX_PACKAGES[@]}"
log_cmd nix-env --install \
  --no-build-output \
  --quiet \
  "${NIX_PACKAGES[@]}"

#
# yarn install
#
log NOTICE 'Collecting yarn packages'
IFS=" " read -r -a YARN_PACKAGES <<< "$(collectFiles 'install' 'yarn.list')"

log NOTICE 'Installing yarn packages'
log DEBUG "${YARN_PACKAGES[@]}"
log_cmd yarn global add "${YARN_PACKAGES[@]}" --non-interactive

##
## Cleaning
##
log NOTICE 'Cleaning'
log_cmd sudo apt-get autoremove -y

##
## Hack to reload user groups without logging out and in
##
log NOTICE 'Verifying docker group'
id | grep -q '999(docker)' || exec sg docker newgrp "$(id -gn)" | log DEBUG
