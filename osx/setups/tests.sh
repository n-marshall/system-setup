# source helper-functions.sh
clear

getAndAppend(){
    # create file if doesn't exist, with right permission
    [[ ! -s $2 ]] && touch "$2" || [[ ! -s $2 ]] && sudo touch "$2"
    # append stuff to it
    [[ ! -e $2 ]] || [[ -w $2 ]] && curl -sSL $1 >> $2 || [[ -e $2 ]] && [[ ! -w $2 ]] && curl -sSL "$1" | sudo tee -- "$2" >/dev/null
    [[ ! -e $2 ]] || [[ -w $2 ]] && printf "\n" >> $2 || [[ -e $2 ]] && [[ ! -w $2 ]] && sudo bash -c "printf \"\n\" >> $2"
}

append(){
    [ -w $2 ] && printf $1 >> $2 || sudo bash -c "printf $1 >> $2"
}

file=/etc/.safetodelete
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