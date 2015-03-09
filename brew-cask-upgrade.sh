#!/bin/bash
# Expanded version adapted from
# https://github.com/caskroom/homebrew-cask/issues/309#issuecomment-36743989

function usage {
    cat <<EOF
USAGE:
    Pass the -c or --clean-old flag to remove old versions as well.
EOF
}

if [[ $1 = "-h" || $1 = "--help" ]] ; then
    usage
else
    for cask in $(brew cask list); do
        caskInfo=$(brew cask info $cask)
        caskIsNotInstalled=$(grep -F "Not installed" <<< $caskInfo)
        if [[ -n $caskIsNotInstalled ]] ; then
            brew cask install $cask
            if [[ $1 = "-c" || $1 = "--clean-old" ]] ; then
                caskDirectory=/opt/homebrew-cask/Caskroom/$cask
                versionsToRemove=$(ls -r $caskDirectory | sed 1,1d)
                for versionToRemove in $versionsToRemove ; do
                    echo "Removing $cask $versionToRemove..."
                    rm -rf $caskDirectory/$versionToRemove
                done
            fi
        fi
    done
fi
