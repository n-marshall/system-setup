mkcd () {
    mkdir -p $1
    cd $1
}

randstring32() {
    cat /dev/urandom | tr -dc 'a-zA-Z0-9' | fold -w 32 | head -n 1
}

randstring8() {
    cat /dev/urandom | tr -dc 'a-zA-Z0-9' | fold -w 8 | head -n 1
}

wgetAndDpkg() {
	cd ~
	URL=$1
	FILE=`mktemp`
	wget "$URL" -O $FILE && sudo dpkg -i --force-depends $FILE	
	rm $FILE
}

wgetAndExecute() {
	URL=$1
	FILE=`mktemp`
	wget "$URL" -O $FILE
    chmod +x $FILE
    $FILE	
	rm $FILE
}

wgetAndSh() {
    URL=$1
	FILE=`mktemp`
	wget "$URL" -O $FILE
    sh $FILE
	rm $FILE
}

extract() {
    if [ -z "$1" ]; then
        echo "Usage: extract <path/file_name>.<zip|rar|bz2|gz|tar|tbz2|tgz|Z|7z|xz|ex|tar.bz2|tar.gz|tar.xz>"
    else
        if [ -f $1 ] ; then
            if [ $# -eq 2 ]; then 
                DEST=$2
            else 
                DEST=${1%.*}
            fi

            case $1 in
            # *.tar.bz2)   tar xvjf ../$1    ;;
            *.tar.gz)    tar xvzf ${DEST} $1    ;;
            # *.tar.xz)    tar xvJf ../$1    ;;
            # *.lzma)      unlzma ../$1      ;;
            # *.bz2)       bunzip2 ../$1     ;;
            # *.rar)       unrar x -ad ../$1 ;;
            # *.gz)        gunzip ../$1      ;;
            *.tar)       tar xvf ${DEST} $1     ;;
            # *.tbz2)      tar xvjf ../$1    ;;
            *.tgz)       tar -xvzf ${1} --directory=${DEST}    ;;
            *.zip)       unzip -d ${DEST} $1      ;;
            # *.Z)         uncompress ../$1  ;;
            *.7z)        7z x $1 -o${DEST}        ;;
            # *.xz)        unxz ../$1        ;;
            # *.exe)       cabextract ../$1  ;;
            *)           echo "extract: '$1' - unknown archive method" ;;
            esac
        else
            echo "$1 - file does not exist"
        fi
    fi
}

getAndExtract() {
    DWN_DEST=`mktemp -d`
    EXTRACT_DEST=`mktemp -d`
    DEST=${2}
    wget --content-disposition ${1} -P ${DWN_DEST}
    for f in ${DWN_DEST}/* 
    do
        echo "extracting file ${f} into ${EXTRACT_DEST}..."
        mkdir -p ${EXTRACT_DEST}
        extract ${f} ${EXTRACT_DEST}
    done
    [[ -w ${DEST} ]] && needSU=1
    echo ${needSU}
    rm -rf ${DWN_DEST}
    rm -rf ${EXTRACT_DEST}
}

newxp() {
    dir=$(randstring8)
    mkcd ~/dev/experiments/${dir}
    code .
}

newgoXP() {
    dir=$(randstring8)
    mkcd ~/dev/go/src/experiments/${dir}
    code .
}
