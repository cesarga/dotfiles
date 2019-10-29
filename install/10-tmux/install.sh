#!/usr/bin/env bash

if noexists-exec 'tmux'; then
  __apt_install-package tmux
fi
