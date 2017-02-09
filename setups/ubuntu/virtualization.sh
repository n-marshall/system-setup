#!/bin/bash
[[ -z $repo ]] && repo=$(cd $(dirname $BASH_SOURCE[0]) && cd ../.. && pwd)

. "${repo}"/configs/ubuntu/shell-functions.sh

# virtualbox
sudo apt-get remove -y --purge virtualbox virtualbox-dkms
sudo apt-get install -y linux-headers-generic build-essential dkms
sudo apt-get remove -y --purge virtualbox-dkms
sudo apt-get install -y virtualbox
sudo apt-get install -y virtualbox-dkms
## sign virtualbox for secure boot
# openssl req -new -x509 -newkey rsa:2048 -keyout MOK.priv -outform DER -out MOK.der -nodes -days 36500 -subj "/CN=Descriptive name/"
# sudo /usr/src/linux-headers-$(uname -r)/scripts/sign-file sha256 ./MOK.priv ./MOK.der $(modinfo -n vboxdrv)
# sudo mokutil --import MOK.der
sudo modprobe vboxdrv
sudo modprobe vboxnetflt

# docker
## alternative method
# curl -fsSL https://get.docker.com/ | sh
# sudo usermod -aG docker ubuntu
wgetAndDpkg https://apt.dockerproject.org/repo/pool/main/d/docker-engine/docker-engine_1.13.1-0~ubuntu-yakkety_amd64.deb
sudo groupadd docker
sudo gpasswd -a ${USER} docker
sudo service docker restart
newgrp docker
## vagrant
wgetAndDpkg "https://releases.hashicorp.com/vagrant/1.8.1/vagrant_1.8.1_x86_64.deb"
## otto / azk
wget -nv http://azk.io/install.sh -O- -t 2 -T 10 | sh

# wine
sudo dpkg --add-architecture i386 
sudo add-apt-repository -y ppa:wine/wine-builds
sudo apt-get update
sudo apt-get install -y --install-recommends winehq-devel

# virtualbox again
wgetAndSh() {
    URL=$1
	FILE=`mktemp`
	wget "$URL" -O $FILE
    sudo sh $FILE
	rm $FILE
}
wgetAndSh http://download.virtualbox.org/virtualbox/5.1.12/VirtualBox-5.1.12-112440-Linux_amd64.run

# genymotion
wgetAndExecute https://dl.genymotion.com/releases/genymotion-2.8.1/genymotion-2.8.1_x64.bin
