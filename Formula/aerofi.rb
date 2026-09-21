class Aerofi < Formula
  desc "Lightweight, keyboard- and mouse-driven script launcher for macOS"
  homepage "https://github.com/frostymur/aerofi"
  license "MIT"

  if Hardware::CPU.arm?
    url "https://github.com/frostymur/aerofi/releases/download/v0.2.10/aerofi-mac-arm64.tar.gz"
    sha256 "a997b4171dbe8d64c538ea5f9f2faa04a418ef8ccf98c78a79adc054a56c9636"
  else
    url "https://github.com/frostymur/aerofi/releases/download/v0.2.10/aerofi-mac-x86_64.tar.gz"
    sha256 "cb7e2d68e811695b2c6abf0b1c8059c2ace1a2990062a1aa36f4ae111d0585cf"
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
