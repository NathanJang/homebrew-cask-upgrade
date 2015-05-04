#!/bin/bash

if [[ $1 = "-h" || $1 = "--help" ]] ; then
    cat <<EOF
    USAGE:
        brew cask-clean-old [cask name]
EOF
    exit
fi

function clean-cask {
    cask="$1"
    caskDirectory="/opt/homebrew-cask/Caskroom/$cask"
    versionsToRemove="$(ls -r $caskDirectory | sed 1,1d)"
    for versionToRemove in $versionsToRemove ; do
        echo "Removing $cask $versionToRemove..."
        rm -rf "$caskDirectory/$versionToRemove"
    done
}

if [[ $# -eq 0 ]]; then
    for cask in "$(brew cask list)"; do
        clean-cask "$cask"
    done
else
    clean-cask "$1"
fi
