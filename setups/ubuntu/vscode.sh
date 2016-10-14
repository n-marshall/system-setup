#!/bin/bash
[[ -z $repo ]] && repo=$(cd $(dirname $BASH_SOURCE[0]) && cd ../.. && pwd)

# getAndUnzip 'https://az764295.vo.msecnd.net/public/0.10.1-release/VSCode-linux64.zip' ~/woohoo/vscode

sudo add-apt-repository ppa:ubuntu-desktop/ubuntu-make
sudo apt-get update
sudo apt-get install ubuntu-make

umake ide visual-studio-code --accept-license ~/.local/share/vscode

# add to PATH
sudo ln -s /home/nicolas/.local/share/vscode/bin/code /usr/local/bin/code

# install extensions
code --install-extension donjayamanne.python
code --install-extension msjsdiag.debugger-for-chrome
code --install-extension dbaeumer.vscode-eslint
code --install-extension lukehoban.Go
code --install-extension AdamCaviness.theme-monokai-dark-soda