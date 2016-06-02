#!/bin/sh
read -p "Are you sure you want to run this installation script ? Press [Enter] for yes"

echo "Installing XCode CLT..."
xcode-select --install
read -p "Press [Enter] key to once CLT finished..."
clear

echo "Creating dev environment..."
mkdir ~/dev
mkdir ~/dev/go
clear

echo "Installing Homebrew..."
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
brew doctor
clear

echo "Installing basic stuff..." 
brew install gpg ruby python python3 git zsh wget
clear

echo "Installing Cask..."
brew tap caskroom/cask
clear

echo "Installing Cask applications..."
brew cask install alfred iterm2 ngrok cyberduck google-chrome vagrant visual-studio-code
brew install hg bzr
brew tap caskroom/versions
brew cask info java8
clear

echo "Installing Go..."
brew install go --cross-compile-common
tee -a ~/.bash_profile > /dev/null << EOL

export GOPATH=\$HOME/dev/go
export PATH=\$PATH:\$GOPATH/bin
EOL
source ~/.bash_profile
go get -u golang.org/x/tools/cmd/godoc
#go get -u golang.org/x/tools/cmd/vet
go get github.com/golang/lint/golint
clear

echo "Installing sublime..."
brew cask install caskroom/versions/sublime-text3
go get golang.org/x/tools/cmd/goimports
wget https://packagecontrol.io/Package%20Control.sublime-package -O - > /Users/nicolasmarshall/Library/Application\ Support/Sublime\ Text\ 3/Installed\ Packages/Package\ Control.sublime-package

clear


echo "Installing Docker and Vagrant..."
brew cask install virtualbox
brew cask install vagrant
brew cask install vagrant-manager
brew install docker
brew install boot2docker
brew install docker-compose
clear

echo "Installing RVM..."
gpg --keyserver hkp://keys.gnupg.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3
\curl -sSL https://get.rvm.io | bash -s stable
clear

