#!/bin/bash
[[ -z $repo ]] && repo=$(cd $(dirname $BASH_SOURCE[0]) && cd ../.. && pwd)

. "${repo}"/configs/shell-functions.sh
. "${repo}"/configs/ubuntu/shell-functions.sh

appendIfMissing $REPO/configs/ubuntu/onboot.service /lib/systemd/system/onboot.service
sudo chmod 644 /lib/systemd/system/onboot.service
sudo systemctl daemon-reload
sudo systemctl enable onboot.service

appendIfMissing 