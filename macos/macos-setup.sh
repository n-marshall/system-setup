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
brew install gpg ruby python python3 git zsh wget graphviz
clear

echo "Installing zsh..."
brew install zsh
sudo tee -a /etc/shells > /dev/null <<EOL
#----------------------------------------------------------------
#
/usr/local/bin/zsh
EOL
chsh -s /usr/local/bin/zsh
setopt interactivecomments

tee -a ~/.zshrc > /dev/null <<EOL
#----------------------------------------------------------------
#
if [ -z "$HISTFILE" ]; then
    HISTFILE=$HOME/.zsh_history
fi

HISTSIZE=10000
SAVEHIST=10000
EOL

clear

echo "Installing Cask..."
brew tap caskroom/cask
clear

echo "Installing Cask applications..."
brew cask install alfred iterm2 ngrok cyberduck google-chrome vagrant visual-studio-code
brew install hg bzr
brew tap caskroom/versions
brew cask install java7
brew cask install java
clear

echo "Setting common sh profile..."
tee -a ~/.bash_profile > ~/.zshrc <<EOL
#----------------------------------------------------------------
#
source ~/.common_profile
EOL
clear

echo "Installing Go..."
brew install go --cross-compile-common
tee -a ~/.common_profile > /dev/null <<EOL
#----------------------------------------------------------------
#
export GOPATH=\$HOME/dev/.gopath:\$HOME/dev/go
export PATH=\$PATH:\$GOPATH/bin
EOL
clear

source ~/.common_profile
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
brew install docker-compose

tee -a ~/.common_profile > /dev/null <<EOL
#----------------------------------------------------------------
#
eval \$(docker-machine env default)
EOL
source ~/.common_profile
clear

echo "Installing RVM..."
gpg --keyserver hkp://keys.gnupg.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3
\curl -sSL https://get.rvm.io | bash -s stable
clear

echo "Configuring Git..."
tee ~/.gitignore_global > /dev/null <<EOL
#----------------------------------------------------------------
#
# Compiled source #
###################
*.com
*.class
*.dll
*.exe
*.o
*.so

# Packages #
############
# it's better to unpack these files and commit the raw source
# git has its own built in compression methods
*.7z
*.dmg
*.gz
*.iso
*.jar
*.rar
*.tar
*.zip

# Logs and databases #
######################
*.log
*.sql
*.sqlite

# OS generated files #
######################
.DS_Store
.DS_Store?
._*
.Spotlight-V100
.Trashes
ehthumbs.db
Thumbs.db
EOL
git config --global core.excludesfile ~/.gitignore_global
clear

echo "Typeform specific stuff..."
sudo tee -a /etc/hosts > /dev/null <<EOL
#----------------------------------------------------------------
#
192.168.33.11  admin.typeform.dev signup.typeform.dev login.typeform.dev api.typeform.dev billing.typeform.dev
EOL
clear

echo "Setting aliases..."
tee -a ~/.common_profile > /dev/null <<EOL
#----------------------------------------------------------------
#
alias ndr='cd ~/dev/go/src/github.com/Typeform/andorra'
alias wrk='cd ~/dev/go/src/github.com/Typeform/workers'
alias brn='cd ~/dev/go/src/github.com/Typeform/brownie'
alias trm='cd ~/dev/go/src/github.com/Typeform/tiramisu'
alias dcs='cd ~/dev/go/src/github.com/Typeform/api-docs'
alias dcs='cd ~/dev/go/src/github.com/Typeform/biscuit'
alias cddog='cd ~/dev/go/src/github.com/dogtools/dog'
alias xp='cd ~/dev/go/src/experiments'
alias phx='cd ~/dev/typeform/phoenix-osx'
alias docker-restart='docker-machine restart && eval $(docker-machine env)'
EOL
source ~/.common_profile
clear

echo "Setting key repeat rate..."
# normal minimum is 15 (225 ms)
defaults write -g InitialKeyRepeat -int 10
# normal minimum is 2 (30 ms)
defaults write -g KeyRepeat -int 2
clear



