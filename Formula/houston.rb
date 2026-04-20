class Houston < Formula
  desc "Terminal UI for managing GitHub Actions workflows and deployments"
  homepage "https://github.com/noetic-sys/houston"
  version "0.1.10"
  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/noetic-sys/houston/releases/download/v0.1.10/houston-aarch64-apple-darwin.tar.xz"
      sha256 "f38f76bdcea7bcc39c1b4cccd940a2ed6c75ee9e6530ecb24c5125ffeb8a9b4f"
    end
    if Hardware::CPU.intel?
      url "https://github.com/noetic-sys/houston/releases/download/v0.1.10/houston-x86_64-apple-darwin.tar.xz"
      sha256 "781547dbb13c3a868efafb90d5b389eadffd14f9d075167b6f05618ec31c16de"
    end
  end
  if OS.linux?
    if Hardware::CPU.arm?
      url "https://github.com/noetic-sys/houston/releases/download/v0.1.10/houston-aarch64-unknown-linux-gnu.tar.xz"
      sha256 "345e03f79172a715201bd7ceefdb6ccff5d1259edc3bcd8e3f60a562d9311625"
    end
    if Hardware::CPU.intel?
      url "https://github.com/noetic-sys/houston/releases/download/v0.1.10/houston-x86_64-unknown-linux-gnu.tar.xz"
      sha256 "527ac48e7a6fb0977b7a1b63b52db4fb58d9ae09685d6fb6a87c3ad5680ded01"
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
