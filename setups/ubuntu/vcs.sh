# git
sudo apt-get update
sudo apt-get install -y git
git config --global user.name "Nicolas Marshall"
git config --global user.email "marshall.nicolas@gmail.com"
# hg
sudo apt-get install -y mercurial
cat >> ~/.hgrc <<EOL
[ui]
# Name data to appear in commits
username = Nicolas Marshall <marshall.nicolas@gmail.com>
EOL
# svn
sudo apt-get update
sudo apt-get install -y subversion
# bazaar
sudo apt-get update
sudo apt-get install -y bzr
bzr whoami 'Nicolas Marshall <marshall.nicolas@gmail.com>'
# fossil
sudo apt-get update
sudo apt-get install -y fossil
## generate ssh keys
ssh-keygen -t rsa -f .ssh/id_rsa -P ""