#!/bin/bash
location="ABC$(which brew)"
if [[ $location = "ABC" ]]
then
    /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
else
    echo "brew found at $(which brew). Installing packages..."
fi
cat ${HOME}/init/dotfiles/brew_packages.txt

brew install $(cat ${HOME}/init/dotfiles/brew_packages.txt)
