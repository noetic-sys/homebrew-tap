class Idx < Formula
  desc "Semantic code search for your dependencies"
  homepage "https://github.com/noetic-sys/index"
  version "0.1.9"
  license "AGPL-3.0-or-later"

  on_macos do
    on_intel do
      url "https://github.com/noetic-sys/index/releases/download/v0.1.9/idx-darwin-amd64.tar.gz"
      sha256 "f0e4613870e30d3a5258abdffd53f54e9f5aaa49909666235b0919171c05ce45"
    end
    on_arm do
      url "https://github.com/noetic-sys/index/releases/download/v0.1.9/idx-darwin-arm64.tar.gz"
      sha256 "5112b2b0a852647ff1cac300781c0641046d512983bc727239638235200770f2"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/noetic-sys/index/releases/download/v0.1.9/idx-linux-amd64.tar.gz"
      sha256 "8e1813761814ec903515306e07b24d9882162b81cf5f0ae0367be84492b17ddc"
    end
    on_arm do
      url "https://github.com/noetic-sys/index/releases/download/v0.1.9/idx-linux-arm64.tar.gz"
      sha256 "a8145638f23908316c60f9d96642b0bded95cdb043d0b0268dc5f7ef92d2aa49"
    end
  end

  def install
    bin.install Dir["idx-*"].first => "idx"
  end

  test do
    system "#{bin}/idx", "--version"
  end
end
