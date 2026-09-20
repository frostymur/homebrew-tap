class Aerofi < Formula
  desc "Lightweight, keyboard- and mouse-driven script launcher for macOS"
  homepage "https://github.com/frostymur/aerofi"
  license "MIT"

  if Hardware::CPU.arm?
    url "https://github.com/frostymur/aerofi/releases/download/v0.2.4/aerofi-mac-arm64.tar.gz"
    sha256 "a508ef4b06964931e5770e28c2ddfaec8ecb3efc3296bdd39663ff66215e1310"
  else
    url "https://github.com/frostymur/aerofi/releases/download/v0.2.4/aerofi-mac-x86_64.tar.gz"
    sha256 "d362c31fec896b2c91d16ea2bb99f4086f55798c0ff6dfe355aeb39fbde3d836"
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
