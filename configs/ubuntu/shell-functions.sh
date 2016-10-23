mkcd () {
    mkdir -p $1
    cd $1
}

wgetAndDpkg() {
	cd ~
	URL=$1
	FILE=`mktemp`
	wget "$URL" -O $FILE && sudo dpkg -i --force-depends $FILE	
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
            # *.tar.gz)    tar xvzf ../$1    ;;
            # *.tar.xz)    tar xvJf ../$1    ;;
            # *.lzma)      unlzma ../$1      ;;
            # *.bz2)       bunzip2 ../$1     ;;
            # *.rar)       unrar x -ad ../$1 ;;
            # *.gz)        gunzip ../$1      ;;
            # *.tar)       tar xvf ../$1     ;;
            # *.tbz2)      tar xvjf ../$1    ;;
            # *.tgz)       tar xvzf ../$1    ;;
            *.zip)         unzip -d ${DEST} $1      ;;
            # *.Z)         uncompress ../$1  ;;
            # *.7z)        7z x ../$1        ;;
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
    TMPDIR=`mktemp -d`
    DEST=$2
    wget --content-disposition $1 -P $TMPDIR
    extract $TMPDIR/* $DEST
    rm -rf $TMPDIR
}
