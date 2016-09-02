echo "Typeform specific stuff..."
sudo tee -a /etc/hosts > /dev/null <<EOL
#----------------------------------------------------------------
#
192.168.33.11  admin.typeform.dev signup.typeform.dev login.typeform.dev api.typeform.dev billing.typeform.dev
EOL
clear


echo "Setting aliases..."
tee -a ~/.profile > /dev/null <<EOL
#----------------------------------------------------------------
#
alias ndr='cd ~/dev/go/src/github.com/Typeform/andorra'
alias wrk='cd ~/dev/go/src/github.com/Typeform/workers'
alias brn='cd ~/dev/go/src/github.com/Typeform/brownie'
alias trm='cd ~/dev/go/src/github.com/Typeform/tiramisu'
alias dcs='cd ~/dev/go/src/github.com/Typeform/api-docs'
alias bsc='cd ~/dev/go/src/github.com/Typeform/biscuit'
alias phx='cd ~/dev/typeform/phoenix-osx'
EOL
source ~/.profile
clear