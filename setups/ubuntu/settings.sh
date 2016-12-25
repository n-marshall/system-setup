#!/bin/bash
[[ -z $repo ]] && repo=$(cd $(dirname $BASH_SOURCE[0]) && cd ../.. && pwd)

. "${repo}"/configs/shell-functions.sh

# onboot
appendIfMissing $REPO/configs/ubuntu/onboot.service /lib/systemd/system/onboot.service
sudo chmod 644 /lib/systemd/system/onboot.service
sudo systemctl daemon-reload
sudo systemctl enable onboot.service

# xmodmap
appendIfMissing "${repo}"/configs/ubuntu/.xmodmap ~/.xmodmap
appendIfMissing "${repo}"/configs/ubuntu/.xinitrc ~/.xinitrc

#xbindkeys
sudo apt-get -y install xbindkeys xvkbd
## ctrl-alt as altgr alias
appendIfMissing "${repo}"/configs/ubuntu/.xbindkeysrc ~/.xbindkeysrc
## reload xbindkeys
xbindkeys -f ~/.xbindkeysrc

# theme
sudo apt-get install -y unity-tweak-tool

sudo add-apt-repository -y ppa:noobslab/themes
sudo apt-get update
sudo apt-get install -y arc-theme


# aliases
appendIfMissing "${repo}"/configs/ubuntu/shell-functions.sh ~/.shrc
appendIfMissing "${repo}"/configs/ubuntu/.shrc.aliases ~/.shrc