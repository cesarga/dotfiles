#!/usr/bin/env bash

if noexists-exec 'php'; then
  if [[ ! $(apt-cache policy | grep ondrej/php) ]]; then
    sudo LC_ALL=C.UTF-8 add-apt-repository -y ppa:ondrej/php
  fi

  __apt_install-packages <<-EOF
		php7.3
		php7.3-common
		php7.3-mysql
		php7.3-xml
		php7.3-xmlrpc
		php7.3-curl
		php7.3-gd
		php7.3-imagick
		php7.3-cli
		php7.3-dev
		php7.3-imap
		php7.3-mbstring
		php7.3-opcache
		php7.3-soap
		php7.3-zip
		php7.3-intl
	EOF
fi

if noexists-exec 'composer'; then
  COMPOSER_HASH=76a7060ccb93902cd7576b67264ad91c8a2700e2
  wget "https://raw.githubusercontent.com/composer/getcomposer.org/${COMPOSER_HASH}/web/installer" -O - -q | php -- --quiet
fi
