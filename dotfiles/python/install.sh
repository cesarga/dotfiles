#!/usr/bin/env bash

VERSION=3.7

# Use specified version as `python3` alternative
sudo update-alternatives --install /usr/bin/python3 python3 "$(command -v "python$VERSION")" 1

# Use specified version as `python` alternative
sudo update-alternatives --install /usr/bin/python python "$(command -v "python$VERSION")" 1

#python3.7 -m pip install pip
