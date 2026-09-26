class Aerofi < Formula
  desc "Lightweight, keyboard- and mouse-driven script launcher for macOS"
  homepage "https://github.com/frostymur/aerofi"
  license "MIT"

  if Hardware::CPU.arm?
    url "https://github.com/frostymur/aerofi/releases/download/v0.2.20/aerofi-mac-arm64.tar.gz"
    sha256 "08192947622bf288f91b8143034870ef91202c6421fe54342128346c749558f0"
  else
    url "https://github.com/frostymur/aerofi/releases/download/v0.2.20/aerofi-mac-x86_64.tar.gz"
    sha256 "5382085f9e5a687cbbb7ee48f6d718cc6f9c73a22b01d60942b122681ed54a6c"
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
