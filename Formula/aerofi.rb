class Aerofi < Formula
  desc "Lightweight, keyboard- and mouse-driven script launcher for macOS"
  homepage "https://github.com/frostymur/aerofi"
  license "MIT"

  if Hardware::CPU.arm?
    url "https://github.com/frostymur/aerofi/releases/download/v0.2.18/aerofi-mac-arm64.tar.gz"
    sha256 "99d794b8db8a7195b118a01a708f028544dc7904acbfafca6015842a2e3806a9"
  else
    url "https://github.com/frostymur/aerofi/releases/download/v0.2.18/aerofi-mac-x86_64.tar.gz"
    sha256 "97548bb951cc4e97456e3d07ab0bb8aebd5bee68f1af48ed376f94038e5ef293"
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
