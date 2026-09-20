class Aerofi < Formula
  desc "Lightweight, keyboard- and mouse-driven script launcher for macOS"
  homepage "https://github.com/frostymur/aerofi"
  license "MIT"

  if Hardware::CPU.arm?
    url "https://github.com/frostymur/aerofi/releases/download/v0.2.5/aerofi-mac-arm64.tar.gz"
    sha256 "c4a8ec12c5103aa6e7b682f542020d3341adbc30a25dcc1084618b9d0fe2efcd"
  else
    url "https://github.com/frostymur/aerofi/releases/download/v0.2.5/aerofi-mac-x86_64.tar.gz"
    sha256 "d9fccfa8c28276f21ff16cfbdaeb5c574ebabced9591540f2ef825849fb0cf61"
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
