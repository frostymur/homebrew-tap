class Aerofi < Formula
  desc "Lightweight, keyboard- and mouse-driven script launcher for macOS"
  homepage "https://github.com/frostymur/aerofi"
  license "MIT"

  if Hardware::CPU.arm?
    url "https://github.com/frostymur/aerofi/releases/download/v0.2.0/aerofi-mac-arm64.tar.gz"
    sha256 "7b3401c5cbf8a7f307ade304adb65960df0604e49f970b3bd09ffdf55b2dcd7e"
  else
    url "https://github.com/frostymur/aerofi/releases/download/v0.2.0/aerofi-mac-x86_64.tar.gz"
    sha256 "3d4f8b223e668dbfc8a1a9b8b17aad4ef13476b3664d778a13db3b51f87fdc6e"
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
