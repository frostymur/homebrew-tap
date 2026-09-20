class Aerofi < Formula
  desc "Lightweight, keyboard- and mouse-driven script launcher for macOS"
  homepage "https://github.com/frostymur/aerofi"
  license "MIT"

  if Hardware::CPU.arm?
    url "https://github.com/frostymur/aerofi/releases/download/v0.2.7/aerofi-mac-arm64.tar.gz"
    sha256 "9eb1731535619eccc1261a6ae6ec2243ab78e65095b8ee1f006e64471e3fb6ce"
  else
    url "https://github.com/frostymur/aerofi/releases/download/v0.2.7/aerofi-mac-x86_64.tar.gz"
    sha256 "7c0a4d0f8e7c9cd935b4bb93896c58316074ba5894ed7aa8f20daa8b3b6f6726"
  end

  def install
    bin.install "aerofi"
  end

  service do
    run opt_bin/"aerofi"
    keep_alive true
    process_type :interactive
  end

  test do
    system bin/"aerofi", "--version"
  end
end
