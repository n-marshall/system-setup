createFileIfMissing(){
    # create file if doesn't exist, with right permission
    [[ ! -s $1 ]] && touch "$1" || [[ ! -s $1 ]] && sudo touch "$1"
}

addNewLineToFile(){
    [[ ! -e $1 ]] || [[ -w $1 ]] && printf "\n" >> $1 || [[ -e $1 ]] && [[ ! -w $1 ]] && sudo bash -c "printf \"\n\" >> $1"
}

appendFromURL(){
    createFileIfMissing $2
    [[ ! -e $2 ]] || [[ -w $2 ]] && curl -sSL $1 >> $2 || [[ -e $2 ]] && [[ ! -w $2 ]] && curl -sSL $1 | sudo tee -a "$2" >/dev/null
    addNewLineToFile $2
}

appendFromString(){
    createFileIfMissing $2
    [[ ! -e $2 ]] || [[ -w $2 ]] && printf $1 >> $2 || [[ -e $2 ]] && [[ ! -w $2 ]] && sudo bash -c "printf $1 >> $2"
    addNewLineToFile $2
}

appendFromFile(){
    createFileIfMissing $2
    [[ ! -e $2 ]] || [[ -w $2 ]] && cat $1 >> $2 || [[ -e $2 ]] && [[ ! -w $2 ]] && sudo bash -c "cat $1 >> $2"
    addNewLineToFile $2
}

appendIfMissing(){
    [[ -z $repo ]] && repo=$(cd $(dirname $BASH_SOURCE[0]) && cd .. && pwd)
    python "${repo}"/configs/appendIfMissing.py $1 $2
}


    



