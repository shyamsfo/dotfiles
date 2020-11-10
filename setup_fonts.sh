#!/bin/bash
#git submodule add  https://github.com/powerline/fonts.git .
git submodule init
git submodule update
cd ${HOME}/init/dotfiles/fonts
./install.sh
