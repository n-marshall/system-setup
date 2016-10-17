#!/bin/bash
[[ -z $repo ]] && repo=$(cd $(dirname $BASH_SOURCE[0]) && cd ../.. && pwd)

. "${repo}"/configs/shell-functions.sh
. "${repo}"/configs/osx/shell-functions.sh

echo "Installing Docker and Vagrant..."
brew cask install virtualbox
brew cask install vagrant

installDmgFromUrl 'https://download.docker.com/mac/stable/Docker.dmg'

appendIfMissing ../configs/.shrc.docker ~/.shrc
clear