class Aerofi < Formula
  desc "Lightweight, keyboard- and mouse-driven script launcher for macOS"
  homepage "https://github.com/frostymur/aerofi"
  license "MIT"

  if Hardware::CPU.arm?
    url "https://github.com/frostymur/aerofi/releases/download/v0.2.13/aerofi-mac-arm64.tar.gz"
    sha256 "b5adca5c3c7f9856dd848e59a3b3dceaa2b0e3532e22fcdf67a0886a0fed630e"
  else
    url "https://github.com/frostymur/aerofi/releases/download/v0.2.13/aerofi-mac-x86_64.tar.gz"
    sha256 "3def94f76a04f8e4a2d80d760acc7a5deed6a0494c910e2a70f20e10e0d46428"
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
