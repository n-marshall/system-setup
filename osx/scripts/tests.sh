source helper-functions.sh
clear

file="~/.wot"
res2=$(wget -qO- 'https://raw.github.com/n-marshall/system-setup/master/common/configs/.gitignore_global' | xargs -0 echo)
[ -w $file ] && tee -a $res2 $file || sudo tee -a $res2 $file

append "fhjklsdhfdasdasd" ~/.wot
append --separate "fjdklsjdfkl\nhjskdfhjksdf" ~/.wot
cat ~/.wot
rm -f ~/.wot

# getAndAppend https://raw.github.com/n-marshall/system-setup/master/common/configs/.gitignore_global ~/.wotwot
# cat ~/.wotwot