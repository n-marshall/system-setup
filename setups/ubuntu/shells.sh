# zsh
sudo apt-get install -y zsh
zsh --version
chsh -s $(which zsh)
# oh-my-zsh
sh -c "$(wget https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)"
## source bashrc and profile
appendIfMissing ". ~/.shrc" ~/.bashrc
appendIfMissing ". ~/.shrc" ~/.zshrc