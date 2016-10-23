#!/bin/bash
[[ -z $repo ]] && repo=$(cd $(dirname $BASH_SOURCE[0]) && cd .. && pwd)

# prompt before starting
read -p "Are you sure you want to run this install script ? " -n 1 -r
echo    # (optional) move to a new line
[[ ! $REPLY =~ ^[Yy]$ ]] && exit 1

# import libraries
. "${repo}"/configs/shell-functions.sh
. "${repo}"/configs/ubuntu/shell-functions.sh



. "${repo}"/setups/ubuntu/shells.sh
. "${repo}"/setups/ubuntu/programming-languages.sh

. "${repo}"/setups/ubuntu/dir-structure.sh
. "${repo}"/setups/ubuntu/rambox.sh
. "${repo}"/setups/ubuntu/vcs.sh
. "${repo}"/setups/ubuntu/settings.sh
. "${repo}"/setups/ubuntu/vscode.sh
. "${repo}"/setups/ubuntu/virtualization.sh
. "${repo}"/setups/ubuntu/applications.sh
