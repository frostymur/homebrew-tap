class Aerofi < Formula
  desc "Lightweight, keyboard- and mouse-driven script launcher for macOS"
  homepage "https://github.com/frostymur/aerofi"
  license "MIT"

  if Hardware::CPU.arm?
    url "https://github.com/frostymur/aerofi/releases/download/v0.2.26/aerofi-mac-arm64.tar.gz"
    sha256 "81f5d939388b2f621312f9762c143df6969b26bb71a6e59b50524f2f1a47f5b1"
  else
    url "https://github.com/frostymur/aerofi/releases/download/v0.2.26/aerofi-mac-x86_64.tar.gz"
    sha256 "4a2774c9d36ecfc3e8688bfc9ab76991c5ffcf46c37c069ee0bdad08166aee99"
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
