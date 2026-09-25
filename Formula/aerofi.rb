class Aerofi < Formula
  desc "Lightweight, keyboard- and mouse-driven script launcher for macOS"
  homepage "https://github.com/frostymur/aerofi"
  license "MIT"

  if Hardware::CPU.arm?
    url "https://github.com/frostymur/aerofi/releases/download/v0.2.17/aerofi-mac-arm64.tar.gz"
    sha256 "1c4e62499f04610b1afd6bc2d614907e81b2414254d22a2de0ce9dd6eb53b8da"
  else
    url "https://github.com/frostymur/aerofi/releases/download/v0.2.17/aerofi-mac-x86_64.tar.gz"
    sha256 "79e4cff0cd2ecc8ec3adf84716a3922e900808a1a3852e560c5b4ff196cd4997"
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
