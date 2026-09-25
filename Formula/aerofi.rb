class Aerofi < Formula
  desc "Lightweight, keyboard- and mouse-driven script launcher for macOS"
  homepage "https://github.com/frostymur/aerofi"
  license "MIT"

  if Hardware::CPU.arm?
    url "https://github.com/frostymur/aerofi/releases/download/v0.2.16/aerofi-mac-arm64.tar.gz"
    sha256 "909e7bd7d0e00b2564878aeafef8f53ae5122a5de5e45f27861db2430130d0d9"
  else
    url "https://github.com/frostymur/aerofi/releases/download/v0.2.16/aerofi-mac-x86_64.tar.gz"
    sha256 "5f1a83c710c688d7765d18040df3464267ec083011eb666866fc192ae0d17ac5"
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
