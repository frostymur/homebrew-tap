class Aerofi < Formula
  desc "Lightweight, keyboard- and mouse-driven script launcher for macOS"
  homepage "https://github.com/frostymur/aerofi"
  license "MIT"

  if Hardware::CPU.arm?
    url "https://github.com/frostymur/aerofi/releases/download/v0.2.1/aerofi-mac-arm64.tar.gz"
    sha256 "2d9a5a056ecfb892e98361f91770ea079475117d9564c14992520e401419aa56"
  else
    url "https://github.com/frostymur/aerofi/releases/download/v0.2.1/aerofi-mac-x86_64.tar.gz"
    sha256 "e6514cf2625b3bdef2de4c6ccfe7ef677be6b8386431535c73029c306a7283a8"
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
