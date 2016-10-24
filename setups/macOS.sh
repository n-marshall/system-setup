#!/bin/bash
[[ -z $repo ]] && repo=$(cd $(dirname $BASH_SOURCE[0]) && cd .. && pwd)

read -p "Are you sure you want to run this installation script ? Press [Enter] for yes"

echo "Installing XCode CLT..."
xcode-select --install
read -p "Press [Enter] key to once CLT finished..."
clear

. ./scripts/ruby.sh

echo "Installing Homebrew..."
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
brew doctor
clear

. ../common/configs/.shell-functions

. ./scripts/shell.sh
. ./scripts/git.sh
. ./scripts/go.sh
. ./scripts/text-editor.sh
. ./scripts/docker-&-vms.sh
. ./scripts/settings.sh
. ${repo}/osx/setups/karabiner-elements.sh

echo "Installing basic stuff..."
brew install gpg python python3 wget graphviz
clear

echo "Installing Cask..."
brew tap caskroom/cask
clear

echo "Installing Cask applications..."
brew cask install alfred iterm2 ngrok cyberduck google-chrome vagrant visual-studio-code spotify
brew install hg bzr
brew tap caskroom/versions
brew cask install java7
brew cask install java
clear







