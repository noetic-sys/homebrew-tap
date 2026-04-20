class Idx < Formula
  desc "Semantic code search for your dependencies"
  homepage "https://github.com/noetic-sys/index"
  version "0.2.0"
  license "AGPL-3.0-or-later"

  on_macos do
    on_intel do
      url "https://github.com/noetic-sys/index/releases/download/v0.2.0/idx-darwin-amd64.tar.gz"
      sha256 "ddfaa3658e1e1985fe6815ff2bfc517bbaeca9b917daf5a51f2a1cb6c45cac09"
    end
    on_arm do
      url "https://github.com/noetic-sys/index/releases/download/v0.2.0/idx-darwin-arm64.tar.gz"
      sha256 "aeb60170d7a32831fa5b399586d2dbce46426704347b908ab88db42843d05a26"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/noetic-sys/index/releases/download/v0.2.0/idx-linux-amd64.tar.gz"
      sha256 "9dc8a1bc8c0c2e45953c9546e2acc418faeefcb938bf2ddf17484bc263aceb0c"
    end
    on_arm do
      url "https://github.com/noetic-sys/index/releases/download/v0.2.0/idx-linux-arm64.tar.gz"
      sha256 "bb531283fc82e28af1d199ef45f5a90ddbe1c2c27b672fb895d1c63cf6c8fa53"
    end
  end

  def install
    bin.install Dir["idx-*"].first => "idx"
  end

  test do
    system "#{bin}/idx", "--version"
  end
end
