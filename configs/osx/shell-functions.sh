installDmgFromUrl() {
    URL=$1
    dmg=$(mktemp)
    wget -O ${dmg} $URL
    mountPoint=/Volumes/$(openssl rand -hex 16)
    echo ${mountPoint}
    hdiutil attach ${dmg} -mountpoint ${mountPoint}
    cd ${mountPoint}

    # install any .pkg
    sudo installer -pkg $(find *.pkg) -target "/"

    # install any .app
    for app in $(find ${mountPoint} -type d -maxdepth 2 -name \*.app); do
        cp -a ${app} /Applications/
    done

    hdiutil detach ${mountPoint}
    rm ${dmg}
}

