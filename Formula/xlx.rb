class Xlx < Formula
  desc "Fast CLI tool for reading, writing, and manipulating Excel (.xlsx) spreadsheets"
  homepage "https://github.com/kasandell/cli-tools"
  version "0.1.0"
  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/kasandell/cli-tools/releases/download/v0.1.0/xlx-aarch64-apple-darwin.tar.xz"
      sha256 "a78ac9f693940f81fc0b58fb398b96ec21d9f32a4fbd8df30c854b2d1dbe57c4"
    end
    if Hardware::CPU.intel?
      url "https://github.com/kasandell/cli-tools/releases/download/v0.1.0/xlx-x86_64-apple-darwin.tar.xz"
      sha256 "6e1cbc264c284b7711c4d059a79018969ad29b1b4c4a3286e3ad81fda7e38148"
    end
  end
  if OS.linux?
    if Hardware::CPU.arm?
      url "https://github.com/kasandell/cli-tools/releases/download/v0.1.0/xlx-aarch64-unknown-linux-gnu.tar.xz"
      sha256 "452a8c3ce7025cfa2cd750af80262d7df590f0892c25ee28e2fd8477f0d688bd"
    end
    if Hardware::CPU.intel?
      url "https://github.com/kasandell/cli-tools/releases/download/v0.1.0/xlx-x86_64-unknown-linux-gnu.tar.xz"
      sha256 "a71b42d5a3f468f4e5545ea10ed40945ab4170c9468c4cbcac1f2ae99a63833d"
    end
  end
  license "MIT"

  BINARY_ALIASES = {
    "aarch64-apple-darwin":      {},
    "aarch64-unknown-linux-gnu": {},
    "x86_64-apple-darwin":       {},
    "x86_64-pc-windows-gnu":     {},
    "x86_64-unknown-linux-gnu":  {},
  }.freeze

  def target_triple
    cpu = Hardware::CPU.arm? ? "aarch64" : "x86_64"
    os = OS.mac? ? "apple-darwin" : "unknown-linux-gnu"

    "#{cpu}-#{os}"
  end

  def install_binary_aliases!
    BINARY_ALIASES[target_triple.to_sym].each do |source, dests|
      dests.each do |dest|
        bin.install_symlink bin/source.to_s => dest
      end
    end
  end

  def install
    bin.install "xlx" if OS.mac? && Hardware::CPU.arm?
    bin.install "xlx" if OS.mac? && Hardware::CPU.intel?
    bin.install "xlx" if OS.linux? && Hardware::CPU.arm?
    bin.install "xlx" if OS.linux? && Hardware::CPU.intel?

    install_binary_aliases!

    # Homebrew will automatically install these, so we don't need to do that
    doc_files = Dir["README.*", "readme.*", "LICENSE", "LICENSE.*", "CHANGELOG.*"]
    leftover_contents = Dir["*"] - doc_files

    # Install any leftover files in pkgshare; these are probably config or
    # sample files.
    pkgshare.install(*leftover_contents) unless leftover_contents.empty?
  end
end
