#!/bin/bash
[[ -z $repo ]] && repo=$(cd $(dirname $BASH_SOURCE[0]) && cd ../.. && pwd)

. "${repo}"/configs/shell-functions.sh

# python-pip
sudo apt-get install -y python-pip

# ruby
sudo apt-get install -y ruby-full

# golang
GOLANG_LATEST='1.7.3'
sudo rm -rf /usr/local/go #remove any older version of go
TMPFILE=`mktemp`
wget "https://storage.googleapis.com/golang/go${GOLANG_LATEST}.linux-amd64.tar.gz" -O ${TMPFILE} 
sudo tar -C /usr/local -xzf ${TMPFILE}
rm ${TMPFILE}
appendIfMissing "${repo}"/configs/.shrc.gopath ~/.shrc && . ~/shrc

# java
sudo add-apt-repository -y ppa:webupd8team/java
sudo apt-get update
sudo apt-get install -y oracle-java7-installer oracle-java7-set-default

# nodejs
## install nvm
sudo apt-get install -y build-essential
curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.32.1/install.sh | bash
## load nvm
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm
## install nodejs
nvm install node
## js tooling