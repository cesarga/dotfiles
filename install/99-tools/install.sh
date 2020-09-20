#!/usr/bin/env bash

if ! exists-exec 'dry'; then
  curl -sSf https://moncho.github.io/dry/dryup.sh | sudo sh
  sudo chmod 755 /usr/local/bin/dry
fi

#if noexists-exec 'ansible'; then
#  pip install --user ansible
#fi

# wharfee
# wego
# taskbook
# saws
# percol
# pacu
# lnav
# java
# fzf
# ddns
# composer
# aws
# virtualenv python
# ffmpeg
# gflow
# weirdAAL
# howdoi
# s3cmd
# s4cmd
# speedtest-cli
# yq
# ripgrep
# mdcat
# carbon
# gcalcli
# jrnl
# transfer.sh
# tre
# the_platinum_searcher
# figlet
# pv
# pdd
