class Aerofi < Formula
  desc "Lightweight, keyboard- and mouse-driven script launcher for macOS"
  homepage "https://github.com/frostymur/aerofi"
  license "MIT"

  if Hardware::CPU.arm?
    url "https://github.com/frostymur/aerofi/releases/download/v0.2.14/aerofi-mac-arm64.tar.gz"
    sha256 "aed18e5b23855e849f884050b3f8a4b6e2c621fcb4ef844f13449ace58bceb8d"
  else
    url "https://github.com/frostymur/aerofi/releases/download/v0.2.14/aerofi-mac-x86_64.tar.gz"
    sha256 "2012693a4ef3a21537bba8bbd7c0d0df70553e7436401ee883cda00cb8494da7"
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
