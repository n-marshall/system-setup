wgetAndDpkg() {
	cd ~
	URL=$1
	FILE=`mktemp`
	wget "$URL" -O $FILE && sudo dpkg -i $FILE	
	rm $FILE
}

getAndUnzip(){
    TMPFILE=`mktemp`
    DEST="$2"
    wget "$1" -O $TMPFILE
    unzip -f -d $DEST $TMPFILE
    rm $TMPFILE
}