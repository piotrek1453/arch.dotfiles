#!/usr/bin/bash

# install system packages
grep -v "^#" arch_packages.txt | paru -S --needed --noconfirm -

# install fisher and tide theme
curl -sL https://git.io/fisher | fish -c "source; fisher install jorgebucaran/fisher; fisher install IlanCosman/tide@v6"
# tide configure # run by hand to set up the theme
