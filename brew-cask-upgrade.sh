#!/bin/bash
# Expanded version adapted from
# https://github.com/caskroom/homebrew-cask/issues/309#issuecomment-36743989

if [[ $1 = "-h" || $1 = "--help" ]]; then
    cat <<EOF
    USAGE:
        Pass the -c or --clean-old flag to remove old versions as well.
        Alternatively, run brew cask-clean-old manually.
EOF
    exit
fi

while read cask; do
    caskInfo="$(brew cask info $cask)"
    caskIsNotInstalled="$(grep -F "Not installed" <<< $caskInfo)"
    if [[ -n $caskIsNotInstalled ]]; then
        brew cask install "$cask"
        if [[ $1 = "-c" || $1 = "--clean-old" ]]; then
            if [[ -e "./brew-cask-clean-old" ]]; then
                ./brew-cask-clean-old "$cask"
            elif [[ -e "./brew-cask-clean-old.sh" ]]; then
                ./brew-cask-clean-old.sh "$cask"
            else
                echo "WARNING: brew-cask-clean-old not found."
            fi
        fi
    fi
done <<< "$(brew cask list)"
