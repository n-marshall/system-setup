#!/bin/bash
[[ -z $repo ]] && repo=$(cd $(dirname $BASH_SOURCE[0]) && cd ../.. && pwd)

. "${repo}"/configs/shell-functions.sh
. "${repo}"/configs/ubuntu/shell-functions.sh

sudo apt-get install libappindicator1

LATEST="0.4.4"
URL="https://github.com/saenzramiro/rambox/releases/download/${LATEST}/Rambox-${LATEST}-x64.zip"

INSTALL_DIR=~/.local/share/rambox
getAndExtract ${URL} ${INSTALL_DIR}

chmod +x ${INSTALL_DIR}/linux-unpacked/Rambox

cp -r "${repo}"/customization/sparrow-icons ${INSTALL_DIR}/icons

appendIfMissing "${repo}"/configs/ubuntu/rambox.desktop ~/.local/share/applications/rambox.desktop
chmod +x ~/.local/share/applications/rambox.desktop
sudo update-desktop-database