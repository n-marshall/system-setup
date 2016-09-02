echo "Installing Git..."
brew install git
wgetAndAppend https://raw.github.com/n-marshall/system-setup/master/common/configs/.gitignore_global ~/.gitignore_global
git config --global core.excludesfile ~/.gitignore_global
clear