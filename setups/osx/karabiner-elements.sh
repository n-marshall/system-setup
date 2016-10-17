#!/bin/bash
[[ -z $repo ]] && repo=$(cd $(dirname $BASH_SOURCE[0]) && cd ../.. && pwd)

. "${repo}"/configs/shell-functions.sh
. "${repo}"/configs/osx/shell-functions.sh

# URL='https://pqrs.org/latest/karabiner-elements-latest.dmg'
# dmg=$(mktemp)
# wget -O ${dmg} $URL
# volumeName=$(openssl rand -hex 16)
# echo $volumeName
# hdiutil attach ${dmg} -mountpoint /Volumes/${volumeName}
# cd /Volumes/${volumeName}
# sudo installer -pkg $(find *.pkg) -target "/"
# hdiutil detach /Volumes/${volumeName}
# rm ${dmg}
installFromDmg 'https://pqrs.org/latest/karabiner-elements-latest.dmg'

appendIfMissing ${repo}/osx/configs/karabiner.json ~/.karabiner.d/configuration/karabiner.json