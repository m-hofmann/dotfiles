#!/usr/bin/env sh
# links all config files using GNU stow

find . -maxdepth 1 -not -path '*/\.*' -not -path . -type d -exec sh -c 'stow $(basename {})' \;

