echo "Installing zsh..."
brew install zsh
appendIfMissing "/usr/local/bin/zsh" /etc/shells
chsh -s /usr/local/bin/zsh
setopt interactivecomments
clear

echo "Setting common sh profile..."
appendIfMissing configs/.bash_profile ~/.bash_profile
clear


echo "Setting common sh profile..."
appendIfMissing ../common/configs/.bashrc ~/.bashrc
appendIfMissing ../common/configs/.zshrc ~/.zshrc
clear


echo "Setting aliases..."
appendIfMissing ../common/configs/.shrc.aliases ~/.shrc
source ~/.profile
clear

echo "Installing tmux"
brew install tmux
appendIfMissing configs/.shrc.tmux ~/.shrc
source ~/.profile
clear