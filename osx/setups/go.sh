echo "Installing Go..."
mkdir -pv ~/dev/go
brew install go --cross-compile-common
catAndAppend ../../common/configs/.shrc.gopath ~/.shrc
clear

source ~/.profile
go get -u golang.org/x/tools/cmd/godoc
#go get -u golang.org/x/tools/cmd/vet
go get github.com/golang/lint/golint
clear

