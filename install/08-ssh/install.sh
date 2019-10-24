#!/usr/bin/env bash

if noexists-exec '/c/weasel-pageant-helper.exe'; then
  cp "$HOME/libs/weasel-pageant/helper.exe" '/c/weasel-pageant-helper.exe'
fi
