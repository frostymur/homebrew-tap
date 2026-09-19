class Aerofi < Formula
  desc "Lightweight, keyboard- and mouse-driven script launcher for macOS"
  homepage "https://github.com/frostymur/aerofi"
  license "MIT"

  if Hardware::CPU.arm?
    url "https://github.com/frostymur/aerofi/releases/download/v0.2.2/aerofi-mac-arm64.tar.gz"
    sha256 "6d8f956031d0fa65e66c3cc403b798eef44012888e3be4a8cdda71a05c16ae71"
  else
    url "https://github.com/frostymur/aerofi/releases/download/v0.2.2/aerofi-mac-x86_64.tar.gz"
    sha256 "c16e6b1bc54a02d51999fb38a4cda3fdd3208dd26c6527ff4d1ea7685b976f0a"
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
