#!/usr/bin/env bash

if noexists-exec 'cht.sh'; then
  curl https://cht.sh/:cht.sh | sudo tee /usr/local/bin/cht.sh >/dev/null 2>&1
  sudo chmod +x /usr/local/bin/cht.sh
fi

#if [[ ! -f /usr/share/zsh/functions/Completion/cht.sh/_cht ]]; then
#  curl https://cheat.sh/:zsh | sudo tee /usr/share/zsh/vendor-completions/_cht
#fi
