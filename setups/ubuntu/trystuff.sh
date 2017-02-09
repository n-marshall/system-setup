#!/bin/bash
[[ -z $repo ]] && repo=$(cd $(dirname $BASH_SOURCE[0]) && cd ../.. && pwd)

. "${repo}"/configs/shell-functions.sh
. "${repo}"/configs/ubuntu/shell-functions.sh

# appendIfMissing "${repo}"/configs/ubuntu/.postboot.sh ~/.postboot.sh
# sudo rm /etc/rc.local 
# appendIfMissing "${repo}"/configs/ubuntu/rc.local /etc/rc.local
# sudo chmod +x /etc/rc.local



wgetAndDpkg https://az764295.vo.msecnd.net/stable/ee428b0eead68bf0fb99ab5fdc4439be227b6281/code_1.8.1-1482158209_amd64.deb

# add to PATH
sudo ln -s ~/.local/share/vscode/bin/code /usr/local/bin/code

# install extensions
code --install-extension donjayamanne.python
code --install-extension msjsdiag.debugger-for-chrome
code --install-extension dbaeumer.vscode-eslint
code --install-extension lukehoban.Go
code --install-extension AdamCaviness.theme-monokai-dark-soda

# add configs
cp "${repo}"/configs/vscode.keybindings.json ~/.config/Code/User/keybindings.json 
cp "${repo}"/configs/vscode.settings.json ~/.config/Code/User/settings.json

echo 'try done'