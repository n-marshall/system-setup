#chrome
wgetAndDpkg 'https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb'
## make default browser
sudo update-alternatives --set x-www-browser /usr/bin/google-chrome-stable #apparently not working



#gitkraken
wgetAndDpkg 'https://release.gitkraken.com/linux/gitkraken-amd64.deb'

# android studio
sudo add-apt-repository -y ppa:paolorotolo/android-studio
sudo apt-get update
sudo apt-get install -y android-studio

# mitmproxy / bettercap
pip install mitmproxy
gem install bettercap



# deluge
sudo add-apt-repository -y ppa:deluge-team/ppa
sudo apt-get update
sudo apt-get install -y deluge
## associate magnet links
appendIfMissing "${repo}"/configs/ubuntu/deluge.desktop /usr/share/applications/deluge.desktop
gvfs-mime --set x-scheme-handler/magnet deluge.desktop
sudo update-desktop-database
## add autostart desktop file
appendIfMissing "${repo}"/configs/ubuntu/deluge.desktop ~/.config/autostart/deluge.desktop

# syncthing-gtk
sudo add-apt-repository -y ppa:nilarimogard/webupd8
sudo apt-get update
sudo apt-get install -y syncthing-gtk



# vlc
sudo apt-get update
sudo apt-get install -y vlc

# deadbeef
sudo add-apt-repository -y ppa:starws-box/deadbeef-player
sudo apt-get update
sudo apt-get install -y deadbeef

# beets
pip install beets



# krita
sudo add-apt-repository -y ppa:dimula73/krita
sudo apt-get update
sudo apt-get install -y krita-2.9

# imagemagick
sudo apt-get update
sudo apt-get install -y imagemagick

# mupdf
sudo apt-get install -y mupdf

# cups pdf printer
sudo apt-get install cups



# multi-tab explorer + command

# redshift
sudo apt-get update
sudo apt-get install -y gtk-redshift

# xclip
sudo apt-get install -y xclip