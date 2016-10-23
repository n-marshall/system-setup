#!/bin/bash
[[ -z $repo ]] && repo=$(cd $(dirname $BASH_SOURCE[0]) && cd ../.. && pwd)

. "${repo}"/configs/shell-functions.sh

# zsh
sudo apt-get install -y zsh
zsh --version
chsh -s $(which zsh)
sudo ln -sf /bin/zsh /bin/sh
# oh-my-zsh
sh -c "$(wget https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)"
## source bashrc and profile
sudo apt-get install -y python-pip # dependency for appendIfMissing
appendIfMissing ". ~/.shrc" ~/.bashrc
appendIfMissing ". ~/.shrc" ~/.zshrc

# terminator
sudo add-apt-repository -y ppa:gnome-terminator
sudo apt-get update
sudo apt-get install -y terminator