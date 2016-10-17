installDmgFromUrl() {
    URL=$1
    dmg=$(mktemp)
    wget -O ${dmg} $URL
    volumeName=$(openssl rand -hex 16)
    hdiutil attach ${dmg} -mountpoint /Volumes/${volumeName}
    cd /Volumes/${volumeName}
    sudo installer -pkg $(find *.pkg) -target "/"
    hdiutil detach /Volumes/${volumeName}
    rm ${dmg}
}

