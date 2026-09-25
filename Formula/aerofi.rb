class Aerofi < Formula
  desc "Lightweight, keyboard- and mouse-driven script launcher for macOS"
  homepage "https://github.com/frostymur/aerofi"
  license "MIT"

  if Hardware::CPU.arm?
    url "https://github.com/frostymur/aerofi/releases/download/v0.2.19/aerofi-mac-arm64.tar.gz"
    sha256 "0c604f1b8fa81cd7e45c6faebf83e4d49b7daa923c0cbbebbd589282144fcce4"
  else
    url "https://github.com/frostymur/aerofi/releases/download/v0.2.19/aerofi-mac-x86_64.tar.gz"
    sha256 "7eadbd60e0464498baa0b32c176dfb5e8d5b04b30f8320bf2c55d2899b4870e4"
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
