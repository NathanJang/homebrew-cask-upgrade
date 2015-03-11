homebrew-cask-upgrade
=====================
A small `bash` script to upgrade [`homebrew-cask`](https://github.com/caskroom/homebrew-cask) packages.

Currently, [`homebrew-cask` does not have an upgrade command unlike `homebrew`](https://github.com/caskroom/homebrew-cask/issues/4678).

This script is not supported by the maintainers of `homebrew-cask`.
They will likely object to this hasty implementation.
This script merely provides basic upgrading functionality and the removal of old versions.

Installation
------------
```bash
brew tap nathanjang/cask-upgrade
brew install brew-cask-upgrade
```

Usage
-----
Basic:
```bash
brew cask-upgrade
```

To remove old versions after the new version is installed:
```bash
brew cask-upgrade -c
```
or
```bash
brew cask-upgrade --clean-old
```
