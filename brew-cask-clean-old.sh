#!/bin/bash

if [[ $1 = "-h" || $1 = "--help" ]] ; then
    cat <<EOF
    USAGE:
        brew cask-clean-old [cask name]
EOF
    exit
fi

caskBasePath="/opt/homebrew-cask/Caskroom"

function clean-cask {
    local cask="$1"
    local caskDirectory="$caskBasePath/$cask"
    local versionsToRemove="$(ls -r $caskDirectory | sed 1,1d)"
    if [[ -n $versionsToRemove ]]; then
        while read versionToRemove ; do
            echo "Removing $cask $versionToRemove..."
            rm -rf "$caskDirectory/$versionToRemove"
        done <<< "$versionsToRemove"
    fi
}

if [[ $# -eq 0 ]]; then
    while read cask; do
        clean-cask "$cask"
    done <<< "$(brew cask list)"
else
    clean-cask "$1"
fi
