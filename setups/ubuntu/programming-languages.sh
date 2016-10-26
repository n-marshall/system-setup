# python-pip
sudo apt-get install -y python-pip

# ruby
sudo apt-get install -y ruby-full

# golang
GOLANG_LATEST='1.7.1'
sudo rm -rf /usr/local/go #remove any older version of go
cd ~
wget "https://storage.googleapis.com/golang/go${GOLANG_LATEST}.linux-amd64.tar.gz" #replace with any newer version of go
sudo tar -C /usr/local -xzf "go${GOLANG_LATEST}.linux-amd64.tar.gz"
rm "go${GOLANG_LATEST}.linux-amd64.tar.gz"

# java
sudo add-apt-repository -y ppa:webupd8team/java
sudo apt-get update
sudo apt-get install -y oracle-java7-installer oracle-java7-set-default

# nodejs
curl -sL https://deb.nodesource.com/setup_5.x | sudo -E bash -
sudo apt-get install -y nodejs
sudo apt-get install -y build-essential
## webpack