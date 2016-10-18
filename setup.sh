#!/bin/bash
[[ -z $repo ]] && repo=$(cd $(dirname $BASH_SOURCE[0]) && pwd)

if [[ "$(uname)" == 'Darwin' ]]; then
    echo 'macOS'
elif [[ "$(uname)" == 'Linux' ]]; then
    echo 'Linux'
fi