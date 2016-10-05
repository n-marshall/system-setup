[[ -z $repo ]] && repo=$(cd ../.. && pwd)

URL='https://pqrs.org/latest/karabiner-elements-latest.dmg'
dmg=$(mktemp)
wget -O ${dmg} $URL
volumeName=$(openssl rand -hex 16)
echo $volumeName
hdiutil attach ${dmg} -mountpoint /Volumes/${volumeName}
cd /Volumes/${volumeName}
sudo installer -pkg $(find *.pkg) -target "/"
hdiutil detach /Volumes/${volumeName}
rm ${dmg}

source ${repo}/common/configs/.shell-functions

appendIfMissing ${repo}/osx/configs/karabiner.json ~/.karabiner.d/configuration/karabiner.json