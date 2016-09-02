append() {
    if [ "$1" = "--separate" ]; then
        [[ -s $3 ]] && printf "\n#----------------------------------------------------------------\n\n" | sudo tee -a $3
        echo $2 | sudo tee -a $3
        printf "\n" | sudo tee -a $3
    else
        echo $1 | sudo tee -a $2
    fi
}

getAndAppend() {
    if [ "$1" = "--separate" ]; then
       echo "$(wget $2 -qO-)" $3 | xargs append
    else
        echo ${1}
        content=$(wget -qO- '${1}' | xargs -0 echo)
        echo $content
        $content $2 | xargs -0 append
    fi
}



