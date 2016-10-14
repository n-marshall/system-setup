echo "Typeform specific stuff..."
appendIfMissing configs/hosts.typeform /etc/hosts
clear


echo "Setting aliases..."
appendIfMissing configs/.shrc.typeform ~/.shrc
source ~/.profile
clear