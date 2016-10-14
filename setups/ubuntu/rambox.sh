#!/bin/bash
[[ -z $repo ]] && repo=$(cd $(dirname $BASH_SOURCE[0]) && cd ../.. && pwd)

. "${repo}"/configs/shell-functions.sh
. "${repo}"/configs/ubuntu/shell-functions.sh

LATEST="0.4.4"
URL="https://github.com/saenzramiro/rambox/releases/download/${LATEST}/Rambox-${LATEST}-x64.zip"
echo ${URL}

getAndUnzip ${URL} ~/.local/share/rambox

appendIfMissing "${repo}"/ubuntu/configs/rambox.desktop /usr/share/applications/rambox.desktop


