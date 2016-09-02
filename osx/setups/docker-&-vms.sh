echo "Installing Docker and Vagrant..."
brew cask install virtualbox
brew cask install vagrant
brew cask install vagrant-manager
brew install docker
brew install docker-compose

tee -a ~/.common_profile > /dev/null <<EOL
#----------------------------------------------------------------
#
eval \$(docker-machine env default)
EOL
source ~/.common_profile
clear