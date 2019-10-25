#!/usr/bin/env bash

if noexists-exec '/c/weasel-pageant-helper.exe'; then
  sudo cp "$HOME/libs/weasel-pageant/helper.exe" '/c/weasel-pageant-helper.exe'
fi
