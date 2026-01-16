class Idx < Formula
  desc "Semantic code search for your dependencies"
  homepage "https://github.com/noetic-sys/index"
  version "0.1.0"
  license "AGPL-3.0-or-later"

  on_macos do
    on_intel do
      url "https://github.com/noetic-sys/index/releases/download/v#{version}/idx-darwin-x86_64.tar.gz"
      sha256 "REPLACE_WITH_SHA256"
    end
    on_arm do
      url "https://github.com/noetic-sys/index/releases/download/v#{version}/idx-darwin-arm64.tar.gz"
      sha256 "REPLACE_WITH_SHA256"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/noetic-sys/index/releases/download/v#{version}/idx-linux-x86_64.tar.gz"
      sha256 "REPLACE_WITH_SHA256"
    end
    on_arm do
      url "https://github.com/noetic-sys/index/releases/download/v#{version}/idx-linux-arm64.tar.gz"
      sha256 "REPLACE_WITH_SHA256"
    end
  end

  def install
    bin.install Dir["idx-*"].first => "idx"
  end

  test do
    system "#{bin}/idx", "--version"
  end
end
