echo "Installing Go..."
brew install go --cross-compile-common
tee -a ~/.common_profile > /dev/null <<EOL
#----------------------------------------------------------------
#
export GOPATH=\$HOME/dev/.gopath:\$HOME/dev/go
export PATH=\$PATH:\$GOPATH/bin
EOL
clear

source ~/.common_profile
go get -u golang.org/x/tools/cmd/godoc
#go get -u golang.org/x/tools/cmd/vet
go get github.com/golang/lint/golint
clear

mkdir ~/dev/go