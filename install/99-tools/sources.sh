#!/usr/bin/env bash

# Stripe CLI
STRIPE_SOURCE="deb https://dl.bintray.com/stripe/stripe-cli-deb stable main"
sudo apt-key adv --keyserver hkp://pool.sks-keyservers.net:80 --recv-keys 379CE192D401AB61
grep -qs "$STRIPE_SOURCE" "$SOURCES_LIST" || echo "$STRIPE_SOURCE" | sudo tee -a "$SOURCES_LIST"
