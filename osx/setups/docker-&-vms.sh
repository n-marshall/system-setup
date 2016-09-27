echo "Installing Docker and Vagrant..."
brew cask install virtualbox
brew cask install vagrant
brew cask install vagrant-manager
brew install docker
brew install docker-compose

catAndAppend ../configs/.shrc.docker ~/.shrc
clear