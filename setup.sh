if [[ "$(uname)" == 'Darwin' ]]; then
    echo 'macOS'
elif [[ "$(uname)" == 'Linux' ]]; then
    echo 'Linux'
fi