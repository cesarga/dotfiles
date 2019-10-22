#!/usr/bin/env bash

WEASEL_PAGEANT_VERSION=1.4
DIST_URL="https://github.com/vuori/weasel-pageant/releases/download/v$WEASEL_PAGEANT_VERSION/weasel-pageant-$WEASEL_PAGEANT_VERSION.zip"
FILE_PATTERN="weasel-pageant-$WEASEL_PAGEANT_VERSION/helper.exe"
DST="$HOME/.weasel-pageant"

if [[ ! -f "$DST" ]]; then
  wget -qO- "$DIST_URL" | bsdtar -Oxvf - "$FILE_PATTERN" > "$DST" &&
  chmod 744 "$DST"
fi
