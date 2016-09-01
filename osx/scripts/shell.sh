echo "Installing zsh..."
brew install zsh
sudo tee -a /etc/shells > /dev/null <<EOL
#----------------------------------------------------------------
#
/usr/local/bin/zsh
EOL
chsh -s /usr/local/bin/zsh
setopt interactivecomments

tee -a ~/.zshrc > /dev/null <<EOL
#----------------------------------------------------------------
#
if [ -z "$HISTFILE" ]; then
    HISTFILE=$HOME/.zsh_history
fi

HISTSIZE=10000
SAVEHIST=10000
EOL

clear

echo "Setting common sh profile..."
tee -a ~/.bash_profile > /dev/null <<EOL
#----------------------------------------------------------------
#
[[ -s "$HOME/.bashrc" ]] && source "$HOME/.bashrc" # Load the default .bashrc
EOL
clear


echo "Setting common sh profile..."
tee -a ~/.bashrc > ~/.zshrc <<EOL
#----------------------------------------------------------------
#
[[ -s "$HOME/.profile" ]] && source "$HOME/.profile" # Load the default .profile
EOL
clear


echo "Setting aliases..."
tee -a ~/.profile > /dev/null <<EOL
#----------------------------------------------------------------
#
alias cddog='cd ~/dev/go/src/github.com/dogtools/dog'
alias xp='cd ~/dev/go/src/experiments'
alias docker-restart='docker-machine restart && eval $(docker-machine env)'
alias ls='ls -a'
alias mkdir="mkdir -pv"
alias wget="wget -c"
alias histg="history | grep"
alias echopath='echo $PATH | tr -s ":" "\n"'
alias myip="curl http://ipecho.net/plain; echo"
alias webify="mogrify -resize 690\> *.png"
EOL
source ~/.profile
clear

echo "Installing tmux"
brew install tmux
tee -a ~/.profile > /dev/null <<EOL
#----------------------------------------------------------------
#
tmux
EOL
source ~/.profile
clear