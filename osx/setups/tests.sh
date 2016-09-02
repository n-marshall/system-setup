# source helper-functions.sh
clear

getAndAppend(){
    [ ! -s $2 ] && touch $2
    [ ! -w $2 ] && curl -sSL $1 >> $2 || sudo bash -c "curl -sSL $1 >> $2"
    [ ! -w $2 ] && echo -e "\n" >> $2 || sudo bash -c "echo -e \"\n\""
    cat $2
}

append(){
    [ -w $2 ] && printf $1 >> $2 || sudo bash -c "printf $1 >> $2"
}

file="~/.woto"
url="https://raw.github.com/n-marshall/system-setup/master/common/configs/.gitignore_global"

# sudo bash -c "curl -sSL '$url' > '$file'"

getAndAppend $url $file

# append "fdhjkhsjdfkhjkkfkjshdfjkhj\nsfhkjsdhk\nsdfsdfjghjsgdfhjkghjkgsdfkjghsd" $file
# file="~/.wot"
# res2=$(wget -qO- 'https://raw.github.com/n-marshall/system-setup/master/common/configs/.gitignore_global')
# [ ! -s "$file" ] && touch "$file"
# [ -w "$file" ] && echo "$res2" | tee -a "$res2" "$file" || echo "res2" | sudo tee -a "$file"

# append "fhjklsdhfdasdasd" "$file"
# append --separate "fjdklsjdfkl\nhjskdfhjksdf" "$file"

# getAndAppend https://raw.github.com/n-marshall/system-setup/master/common/configs/.gitignore_global ~/.wotwot