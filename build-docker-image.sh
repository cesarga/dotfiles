#!/usr/bin/env bash

set -e

#docker build --force-rm --no-cache --tag cesarga/dotfiles .
docker build --tag cesarga/dotfiles .

if [[ $(command -v docker) ]] && [[ $(docker login) ]]; then
    docker push cesarga/dotfiles
fi
