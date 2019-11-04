#!/usr/bin/env bash

if noexists-exec 'git-flow'; then
  __apt_install-package git-flow
fi
