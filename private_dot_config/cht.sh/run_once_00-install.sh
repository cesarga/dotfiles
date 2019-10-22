#!/usr/bin/env bash

set -e

if [[ ! "$(command -v cht.sh)" ]]; then
    curl https://cht.sh/:cht.sh | sudo tee /usr/local/bin/cht.sh >/dev/null 2>&1
    sudo chmod +x /usr/local/bin/cht.sh
fi
