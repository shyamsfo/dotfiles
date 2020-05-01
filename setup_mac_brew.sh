#!/usr/bin/env bash
case "$(uname -s)" in
   Darwin)
     export os='mac'
     echo "Mac. Installing brew."
     ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
     echo "Install packages from brew_packages.txt next"
     ;;
   Linux)
     export os='linux'
     echo "Liux. Does not work. exiting..."
     exit 1
     ;;
esac

