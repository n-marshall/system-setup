echo "Installing Git..."
brew install git
appendIfMissing ../../common/configs/.gitignore_global ~/.gitignore_global
git config --global core.excludesfile ~/.gitignore_global
clear