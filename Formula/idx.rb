class Idx < Formula
  desc "Semantic code search for your dependencies"
  homepage "https://github.com/noetic-sys/index"
  version "0.1.8"
  license "AGPL-3.0-or-later"

  on_macos do
    on_intel do
      url "https://github.com/noetic-sys/index/releases/download/v0.1.8/idx-darwin-amd64.tar.gz"
      sha256 "1f5f1c2bc96d0adfe8b97054272773b5a8f566e9a3c3155db09427d76cf08a61"
    end
    on_arm do
      url "https://github.com/noetic-sys/index/releases/download/v0.1.8/idx-darwin-arm64.tar.gz"
      sha256 "a5bcb3d1950b284ee2dbf5b4b3f46bc242f9aa1b7035e9a54301054f303409de"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/noetic-sys/index/releases/download/v0.1.8/idx-linux-amd64.tar.gz"
      sha256 "21ee66e9dc839acab32ea1f8f7b02de954250e9909e11c6c0fff7b487a407308"
    end
    on_arm do
      url "https://github.com/noetic-sys/index/releases/download/v0.1.8/idx-linux-arm64.tar.gz"
      sha256 "360749b7b8261a2129584d72be16a17618878c116657a7ffd600b6e1173f2f22"
    end
  end

  def install
    bin.install Dir["idx-*"].first => "idx"
  end

  test do
    system "#{bin}/idx", "--version"
  end
end
