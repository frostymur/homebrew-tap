class Aerofi < Formula
  desc "Lightweight, keyboard- and mouse-driven script launcher for macOS"
  homepage "https://github.com/frostymur/aerofi"
  license "MIT"

  if Hardware::CPU.arm?
    url "https://github.com/frostymur/aerofi/releases/download/v0.2.21/aerofi-mac-arm64.tar.gz"
    sha256 "a078808754c16bea9b5582d217927a20e4be9facd33b1c7b3ddc6ba50a796495"
  else
    url "https://github.com/frostymur/aerofi/releases/download/v0.2.21/aerofi-mac-x86_64.tar.gz"
    sha256 "1148fe301a3a8e1ddd5f8b92825fadfab4af5c3c24139fb9b21f6bb51a8985c7"
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
