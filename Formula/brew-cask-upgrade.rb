require "formula"

class BrewCaskUpgrade < Formula
    homepage "https://github.com/NathanJang/homebrew-cask-upgrade/"
    version "1.0"
    url "https://raw.githubusercontent.com/NathanJang/homebrew-cask-upgrade/#{version}/brew-cask-upgrade"
    sha256 "aaf018752f7271b08c703b83d0cbfd3e562a932fa046e185d4423007115aa701"

    def install
        bin.install "brew-cask-upgrade"
        (bin + "brew-cask-upgrade").chmod 0755        
    end
end
