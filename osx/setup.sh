#!/bin/sh
read -p "Are you sure you want to run this installation script ? Press [Enter] for yes"

echo "Installing XCode CLT..."
xcode-select --install
read -p "Press [Enter] key to once CLT finished..."
clear

source ./scripts/ruby.sh

echo "Installing Homebrew..."
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
brew doctor
clear

source ../common/configs/.shell-functions

source ./scripts/shell.sh
source ./scripts/git.sh
source ./scripts/go.sh
source ./scripts/text-editor.sh
source ./scripts/docker-&-vms.sh
source ./scripts/settings.sh

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







