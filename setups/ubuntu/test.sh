#!/bin/bash
[[ -z $repo ]] && repo=$(cd $(dirname $BASH_SOURCE[0]) && cd ../.. && pwd)

. "${repo}"/configs/shell-functions.sh
. "${repo}"/configs/ubuntu/shell-functions.sh

# xmodmap
appendIfMissing "${repo}"/configs/ubuntu/.Xmodmap ~/.Xmodmap

# python-pip
sudo apt-get install -y python-pip

# ruby
sudo apt-get install -y ruby-full

# golang
GOLANG_LATEST='1.7.3'
sudo rm -rf /usr/local/go #remove any older version of go
TMPFILE=`mktemp`
wget "https://storage.googleapis.com/golang/go${GOLANG_LATEST}.linux-amd64.tar.gz" -O ${TMPFILE} 
sudo tar -C /usr/local -xzf ${TMPFILE}
rm ${TMPFILE}
appendIfMissing "${repo}"/configs/.shrc.gopath ~/.shrc
. ~/.shrc