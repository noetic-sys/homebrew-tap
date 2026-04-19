class Houston < Formula
  desc "Terminal UI for managing GitHub Actions workflows and deployments"
  homepage "https://github.com/noetic-sys/houston"
  version "0.1.9"
  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/noetic-sys/houston/releases/download/v0.1.9/houston-aarch64-apple-darwin.tar.xz"
      sha256 "7e8df1d644268f124d0fedc5efcfe4194ad12c697c4116c12229341bbf96f3b4"
    end
    if Hardware::CPU.intel?
      url "https://github.com/noetic-sys/houston/releases/download/v0.1.9/houston-x86_64-apple-darwin.tar.xz"
      sha256 "18622c034e2693984a1a9e13f3d05ac77fd3a4173fc7124b68c1104f85fc3f3f"
    end
  end
  if OS.linux?
    if Hardware::CPU.arm?
      url "https://github.com/noetic-sys/houston/releases/download/v0.1.9/houston-aarch64-unknown-linux-gnu.tar.xz"
      sha256 "85dc99a403c9d3e7357a91ea158eb66d5a36298dcef1d76ce7557ac5054cb6c5"
    end
    if Hardware::CPU.intel?
      url "https://github.com/noetic-sys/houston/releases/download/v0.1.9/houston-x86_64-unknown-linux-gnu.tar.xz"
      sha256 "8ab2512dfeee23fee4e97943dc75dd344650de1055b81fa2de8f1f53abefe99d"
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
    bin.install "houston" if OS.mac? && Hardware::CPU.arm?
    bin.install "houston" if OS.mac? && Hardware::CPU.intel?
    bin.install "houston" if OS.linux? && Hardware::CPU.arm?
    bin.install "houston" if OS.linux? && Hardware::CPU.intel?

    install_binary_aliases!

    # Homebrew will automatically install these, so we don't need to do that
    doc_files = Dir["README.*", "readme.*", "LICENSE", "LICENSE.*", "CHANGELOG.*"]
    leftover_contents = Dir["*"] - doc_files

    # Install any leftover files in pkgshare; these are probably config or
    # sample files.
    pkgshare.install(*leftover_contents) unless leftover_contents.empty?
  end
end
