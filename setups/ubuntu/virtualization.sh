#!/bin/bash
[[ -z $repo ]] && repo=$(cd $(dirname $BASH_SOURCE[0]) && cd ../.. && pwd)

. "${repo}"/configs/ubuntu/shell-functions.sh

# virtualbox
sudo apt-get install -y virtualbox
sudo apt-get install -y dkms

# docker
# curl -fsSL https://get.docker.com/ | sh
# sudo usermod -aG docker ubuntu
sudo apt install -y docker.io
## vagrant
wgetAndDpkg "https://releases.hashicorp.com/vagrant/1.8.1/vagrant_1.8.1_x86_64.deb"
## otto / azk
wget -nv http://azk.io/install.sh -O- -t 2 -T 10 | sh

# wine
sudo dpkg --add-architecture i386 
sudo add-apt-repository -y ppa:wine/wine-builds
sudo apt-get update
sudo apt-get install -y --install-recommends winehq-devel
