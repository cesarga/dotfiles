#!/usr/bin/env bash

# Install base system packages
__apt_install-packages <<-EOF
	gnupg-agent
EOF

gpg --import "$XDG_CONFIG_HOME/ssh/tardis.pub"
