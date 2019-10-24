#!/usr/bin/env bash

# Install base system packages
__apt_install-packages <<-EOF
  apt-transport-https
  autoconf
  automake
  ca-certificates
  cmake
  curl
  daemonize
  dbus
  dbus-x11
  gnupg-agent
  lsb-release
  make
  software-properties-common
  wget
  xclip
EOF
