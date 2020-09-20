#!/usr/bin/env bash

# Node.js 14
VERSION=node_14.x
DISTRO="$(lsb_release -s -c)"
NODE_SOURCE="deb https://deb.nodesource.com/$VERSION $DISTRO main"
NODE_SRC_SOURCE="deb-src https://deb.nodesource.com/$VERSION $DISTRO main"
NODE_SOURCES_LIST="/etc/apt/sources.list.d/nodesource.list"
curl -sSL https://deb.nodesource.com/gpgkey/nodesource.gpg.key | sudo apt-key add -
grep -qs "$NODE_SOURCE" "$NODE_SOURCES_LIST" || echo "$NODE_SOURCE" | sudo tee "$NODE_SOURCES_LIST"
grep -qs "$NODE_SRC_SOURCE" "$NODE_SOURCES_LIST" || echo "$NODE_SRC_SOURCE" | sudo tee -a "$NODE_SOURCES_LIST"

# yarn
YARN_SOURCE="deb https://dl.yarnpkg.com/debian/ stable main"
YARN_SOURCES_LIST="/etc/apt/sources.list.d/yarn.list"
curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add -
grep -qs "$YARN_SOURCE" "$YARN_SOURCES_LIST" || echo "$YARN_SOURCE" | sudo tee -a "$YARN_SOURCES_LIST"
