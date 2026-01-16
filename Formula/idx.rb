class Idx < Formula
  desc "Semantic code search for your dependencies"
  homepage "https://github.com/noetic-sys/index"
  version "0.1.5"
  license "AGPL-3.0-or-later"

  on_macos do
    on_intel do
      url "https://github.com/noetic-sys/index/releases/download/v#{version}/idx-darwin-x86_64.tar.gz"
      sha256 "e06fda4acfb45f2ce71821e6a726449193a9aca234131528ad9fc2347ae1e9d9"
    end
    on_arm do
      url "https://github.com/noetic-sys/index/releases/download/v#{version}/idx-darwin-arm64.tar.gz"
      sha256 "4d93094f2ffe5044fa248aad99641a8e1639155a03da2a4757ce9743f50e410d"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/noetic-sys/index/releases/download/v#{version}/idx-linux-x86_64.tar.gz"
      sha256 "c67804d1ae5d8b8aad054c13d567b64a28d7756245478dc334c841a897be13f7"
    end
    on_arm do
      url "https://github.com/noetic-sys/index/releases/download/v#{version}/idx-linux-arm64.tar.gz"
      sha256 "260ea451debdfcc619a7f43335eaf2a9941b493b89aff79686925d59adb9723d"
    end
  end

  def install
    bin.install Dir["idx-*"].first => "idx"
  end

  test do
    system "#{bin}/idx", "--version"
  end
end
