#!/bin/bash
[[ -z $repo ]] && repo=$(cd $(dirname $BASH_SOURCE[0]) && cd ../.. && pwd)

. "${repo}"/configs/shell-functions.sh

# getAndUnzip 'https://az764295.vo.msecnd.net/public/0.10.1-release/VSCode-linux64.zip' ~/woohoo/vscode

# sudo add-apt-repository -y ppa:ubuntu-desktop/ubuntu-make
# sudo apt-get update
# sudo apt-get install -y ubuntu-make

# umake ide visual-studio-code --accept-license ~/.local/share/vscode

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