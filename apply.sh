#!/usr/bin/env sh
# links all config files using GNU stow

find . -maxdepth 1 -type d -exec sh -c 'stow $(basename $0)' {} \;

