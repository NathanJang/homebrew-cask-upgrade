#!/bin/bash
# Expanded version adapted from
# https://github.com/caskroom/homebrew-cask/issues/309#issuecomment-36743989

if [[ $1 = "-h" || $1 = "--help" ]] ; then
    cat <<EOF
    USAGE:
        Pass the -c or --clean-old flag to remove old versions as well.
EOF
    exit
fi

for cask in "$(brew cask list)"; do
    caskInfo="$(brew cask info $cask)"
    caskIsNotInstalled="$(grep -F "Not installed" <<< $caskInfo)"
    if [[ -n $caskIsNotInstalled ]] ; then
        brew cask install "$cask"
        if [[ $1 = "-c" || $1 = "--clean-old" ]] ; then
            ./brew-cask-clean-old "$cask"
        fi
    fi
done
