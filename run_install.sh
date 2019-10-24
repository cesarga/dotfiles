#!/usr/bin/env bash

export CHEZMOI_SOURCEDIR="${HOME}/.local/share/chezmoi"
export CHEZMOI_INSTALLDIR="${CHEZMOI_SOURCEDIR}/install"

#
# Source global helpers
#
source "${CHEZMOI_SOURCEDIR}/helpers/helpers.sh"

#
# Update apt and nix package repositories
#
source "${CHEZMOI_INSTALLDIR}/update-repositories.sh"

#
# Source all install files in alphabetical path order
#
for file in $(find "${CHEZMOI_INSTALLDIR}" -type f -name 'install.sh' | sort) ; do
  source "${file}"
done

#
# Cleaning
#
sudo apt-get autoremove -y

# Hack to reload user groups without logging out and in
if [[ ! $(id | grep '999(docker)') ]]; then
  exec sg docker newgrp `id -gn`
fi