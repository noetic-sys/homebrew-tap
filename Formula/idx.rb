class Idx < Formula
  desc "Semantic code search for your dependencies"
  homepage "https://github.com/noetic-sys/index"
  version "0.1.3"
  license "AGPL-3.0-or-later"

  on_macos do
    on_intel do
      url "https://github.com/noetic-sys/index/releases/download/v#{version}/idx-darwin-x86_64.tar.gz"
      sha256 "833899c2e8674f91acdfc8b7201a7daf1adb502890d3e5d90b6c2d3a94935319"
    end
    on_arm do
      url "https://github.com/noetic-sys/index/releases/download/v#{version}/idx-darwin-arm64.tar.gz"
      sha256 "d624ac3695570192f98b138af03510c4a3f73080afeb4ecb61e84efa48599dd2"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/noetic-sys/index/releases/download/v#{version}/idx-linux-x86_64.tar.gz"
      sha256 "d36447a7bb9dec019c0a5993ecaf7f0fd768d404203c09372d4abe1b87dd13eb"
    end
    on_arm do
      url "https://github.com/noetic-sys/index/releases/download/v#{version}/idx-linux-arm64.tar.gz"
      sha256 "75bba0fd397fcdfa5a32554e2eb72e2db4835dc28a1a7f5219141a8f90973e61"
    end
  end

  def install
    bin.install Dir["idx-*"].first => "idx"
  end

  test do
    system "#{bin}/idx", "--version"
  end
end
