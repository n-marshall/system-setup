#!/bin/bash
[[ -z $repo ]] && repo=$(cd $(dirname $BASH_SOURCE[0]) && cd .. && pwd)

# prompt before starting
read -p "Are you sure you want to run this install script ? " -n 1 -r
echo    # (optional) move to a new line
if [[ ! $REPLY =~ ^[Yy]$ ]] && exit 1

. "${repo}"/configs/shell-functions.sh
. "${repo}"/configs/ubuntu/shell-functions.sh


#################

# FILES AND FOLDERS

declare -a arr=("dev" "Documents" "Movies & Shows" "Graphism" "Books" "Windows/installers" "Windows/portable" "Music" "Photos" "photos_autres" "downloads")
for i in "${arr[@]}"
do
    mkdir -p ${HOME}/"$i"
done


#################

# INSTALLERS

# python-pip
sudo apt-get install -y python-pip

. "${repo}"/setups/ubuntu/rambox.sh
. "${repo}"/setups/ubuntu/vcs.sh
. "${repo}"/setups/ubuntu/settings.sh
. "${repo}"/setups/ubuntu/vscode.sh


# zsh
sudo apt-get install -y zsh
zsh --version
chsh -s $(which zsh)
# oh-my-zsh
sh -c "$(wget https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)"
## source bashrc and profile
sudo tee -a ~/.bashrc > ~/.zshrc <<'EOF'
source /etc/commonprofile
EOF

#chrome
wgetAndDpkg 'https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb'
## make default browser
sudo update-alternatives --set x-www-browser /usr/bin/google-chrome-stable #apparently not working

# golang
GOLANG_LATEST='1.6.1'
sudo rm -rf /usr/local/go #remove any older version of go
cd ~
wget "https://storage.googleapis.com/golang/go$GOLANG_LATEST.linux-amd64.tar.gz" #replace with any newer version of go
sudo tar -C /usr/local -xzf "go$GOLANG_LATEST.linux-amd64.tar.gz"
rm "go$GOLANG_LATEST.linux-amd64.tar.gz"



# ruby
sudo apt-get install -y ruby-full

# java
sudo add-apt-repository -y ppa:webupd8team/java
sudo apt-get update
sudo apt-get install oracle-java7-installer oracle-java7-set-default

#gitkraken
wgetAndDpkg 'https://release.gitkraken.com/linux/gitkraken-amd64.deb'

# vlc
sudo apt-get update
sudo apt-get install -y vlc

# deadbeef
sudo add-apt-repository -y ppa:starws-box/deadbeef-player
sudo apt-get update
sudo apt-get install -y deadbeef

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

# beets
pip install beets

# syncthing-gtk
sudo add-apt-repository -y ppa:nilarimogard/webupd8
sudo apt-get update
sudo apt-get install -y syncthing-gtk

# nodejs
curl -sL https://deb.nodesource.com/setup_5.x | sudo -E bash -
sudo apt-get install -y nodejs
sudo apt-get install -y build-essential
## webpack

# android studio
sudo add-apt-repository -y ppa:paolorotolo/android-studio
sudo apt-get update
sudo apt-get install -y android-studio


# multi-tab explorer + command

# mitmproxy / bettercap
pip install mitmproxy
gem install bettercap

# redshift
sudo apt-get update
sudo apt-get install -y gtk-redshift

# xclip
sudo apt-get install -y xclip

# krita
sudo add-apt-repository -y ppa:dimula73/krita
sudo apt-get update
sudo apt-get install -y krita-2.9

# imagemagick
sudo apt-get update
sudo apt-get install -y imagemagick

# virtualbox
sudo apt-get install -y virtualbox
sudo apt-get install -y dkms

# docker
curl -fsSL https://get.docker.com/ | sh
sudo usermod -aG docker ubuntu
## docker-compose
sudo -i
curl -L https://github.com/docker/compose/releases/download/1.7.1/docker-compose-`uname -s`-`uname -m` > /usr/local/bin/docker-compose
chmod +x /usr/local/bin/docker-compose
exit
## vagrant
wgetAndDpkg "https://releases.hashicorp.com/vagrant/1.8.1/vagrant_1.8.1_x86_64.deb"
## otto / azk
wget -nv http://azk.io/install.sh -O- -t 2 -T 10 | sh

# mupdf
sudo apt-get install -y mupdf

# cups pdf printer
sudo apt-get install cups





##################

# SETTINGS

# xkb keyboard layout
sudo -i
cp /usr/share/X11/xkb/symbols/fr /usr/share/X11/xkb/symbols/fr_backup
tee -a /usr/share/X11/xkb/symbols/fr > /dev/null <<'EOF'
partial alphanumeric_keys
xkb_symbols "qwertified" {

    include "fr(basic)"

    key <AC01>	{ [         a,          A,           ae,           AE ]	};
    key <AB01>	{ [         z,          Z, guillemotleft,        less ]	};
    key <AD03>	{ [         e,          E,     EuroSign,         cent ]	};
    key <AD11>	{ [dead_circumflex, dead_diaeresis, dead_diaeresis, dead_abovering ] };
    key <AD12>	{ [    dollar,   sterling,     currency,  dead_macron ]	};

    key <AD01>	{ [         q,          Q,           at,  Greek_OMEGA ]	};
    key <AC10>	{ [         m,          M,           mu,    masculine ]	};
    key <AC11>	{ [    ugrave,    percent, dead_circumflex, dead_caron]	};
    key <TLDE>	{ [twosuperior, asciitilde,     notsign,      notsign ]	};

    key <BKSL>	{ [  asterisk,         mu,   dead_grave,   dead_breve ]	};
    key <AD02>	{ [         w,          W,      lstroke,      Lstroke ]	};
};

EOF

tee -a /usr/share/X11/xkb/rules/evdev.lst > /usr/share/X11/xkb/rules/base.lst <<'EOF'
qwertified   fr: French (your comment here) 
EOF

## TODO: parse xml and insert at right place
# tee -a /usr/share/X11/xkb/rules/evdev.xml > /usr/share/X11/xkb/rules/base.xml <<'EOF'
# qwertified   fr: French (your comment here) 
# EOF
## reload
rm /var/lib/xkb/*.xkm
exit


#xbindkeys
sudo apt-get -y install xbindkeys xvkbd
## ctrl-alt as altgr alias
appendIfMissing "${repo}"/configs/ubuntu/.xbindkeysrc ~/.xbindkeysrc
## reload xbindkeys
xbindkeys -f ~/.xbindkeysrc

# theme / kde
sudo apt-get install -y unity-tweak-tool

sudo add-apt-repository ppa:noobslab/themes
sudo apt-get update
sudo apt-get install arc-theme


# aliases
sudo tee -a /etc/commonprofile > /dev/null <<'EOF'
mkcd () {
    mkdir -p $1
    cd $1
}

EOF

sudo tee -a /etc/commonprofile > /dev/null <<'EOF'
wgetAndDpkg() {
    cd ~
    URL=$1
    FILE=`mktemp`
    wget "$URL" -O $FILE && sudo dpkg -i $FILE  
    rm $FILE
}

EOF

sudo tee -a /etc/commonprofile > /dev/null <<'EOF'
function extract {
 if [ -z "$1" ]; then
    # display usage if no parameters given
    echo "Usage: extract <path/file_name>.<zip|rar|bz2|gz|tar|tbz2|tgz|Z|7z|xz|ex|tar.bz2|tar.gz|tar.xz>"
 else
    if [ -f $1 ] ; then
        # NAME=${1%.*}
        # mkdir $NAME && cd $NAME
        case $1 in
          *.tar.bz2)   tar xvjf ../$1    ;;
          *.tar.gz)    tar xvzf ../$1    ;;
          *.tar.xz)    tar xvJf ../$1    ;;
          *.lzma)      unlzma ../$1      ;;
          *.bz2)       bunzip2 ../$1     ;;
          *.rar)       unrar x -ad ../$1 ;;
          *.gz)        gunzip ../$1      ;;
          *.tar)       tar xvf ../$1     ;;
          *.tbz2)      tar xvjf ../$1    ;;
          *.tgz)       tar xvzf ../$1    ;;
          *.zip)       unzip ../$1       ;;
          *.Z)         uncompress ../$1  ;;
          *.7z)        7z x ../$1        ;;
          *.xz)        unxz ../$1        ;;
          *.exe)       cabextract ../$1  ;;
          *)           echo "extract: '$1' - unknown archive method" ;;
        esac
    else
        echo "$1 - file does not exist"
    fi
fi
}

EOF

sudo tee -a /etc/commonprofile > /dev/null <<'EOF'
mvAndInstall() {
  FILE=$1
  DESTDIR=$2
  sudo mkdir -p $DESTDIR
  sudo cp -rf $FILE $DESTDIR/$FILE
  sudo rm -rf $FILE
  cd $DESTDIR
  sudo ./$FILE
  sudo gvfs-trash -f $FILE
}

EOF

sudo tee -a /etc/commonprofile > /dev/null <<'EOF'
alias setclip='xclip -selection c'
alias getclip='xclip -selection clipboard -o'

alias godir='cd ~/dev/go/src'

EOF

