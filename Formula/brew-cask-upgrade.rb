class BrewCaskUpgrade < Formula
  homepage "https://github.com/NathanJang/homebrew-cask-upgrade/"
  version "1.0"
  url "git://github.com/NathanJang/homebrew-cask-upgrade.git"

  def install
    FileUtils.mv "brew-cask-upgrade.sh", "brew-cask-upgrade"
    FileUtils.mv "brew-cask-clean-old.sh", "brew-cask-clean-old"
    bin.install "brew-cask-upgrade"
    bin.install "brew-cask-clean-old"
    (bin + "brew-cask-upgrade").chmod 0755
    (bin + "brew-cask-clean-old").chmod 0755
  end

  test do
    system "brew", "cask-upgrade", "-h"
    system "brew", "cask-clean-old", "-h"
  end
end
