# Mirrored from https://github.com/narugit/homebrew-tap/blob/master/Formula/smctemp.rb
# so amiwrpremium/tap/macontrol can declare `depends_on "smctemp"` against
# this tap without forcing end users to `brew tap narugit/tap` first.
#
# Sync this file when narugit/smctemp ships a new upstream release:
#   1. Find the new tag at https://github.com/narugit/smctemp/releases
#   2. curl -L "https://github.com/narugit/smctemp/archive/refs/tags/<ver>.tar.gz" | shasum -a 256
#   3. Bump url + sha256 below.
#
# Upstream license: GPL-2.0-only. This file is metadata only (download URL +
# build recipe), not a derivative of smctemp's source. Crediting upstream
# above is the courteous norm for mirrored Homebrew formulae.

class Smctemp < Formula
  desc "Check Temperature by using Apple System Management Control (Smc) tool"
  homepage "https://github.com/narugit/smctemp"
  url "https://github.com/narugit/smctemp/archive/refs/tags/0.6.0.tar.gz"
  sha256 "834be81fab5d85e32bdc6eb13cd2664cb2f82b5b2e7cacd45401dcd5ccaa06f4"
  license "GPL-2.0-only"

  depends_on :macos

  def install
    system "make"
    bin.install "smctemp"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/smctemp -v")
  end
end
