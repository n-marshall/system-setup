echo "Installing Go..."
mkdir -pv ~/dev/go
brew install go --cross-compile-common
wgetAndAppend https://raw.github.com/n-marshall/system-setup/master/common/configs/.gopath_exports ~/.profile
clear

source ~/.profile
go get -u golang.org/x/tools/cmd/godoc
#go get -u golang.org/x/tools/cmd/vet
go get github.com/golang/lint/golint
clear

