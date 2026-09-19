class Aerofi < Formula
  desc "Lightweight, keyboard- and mouse-driven script launcher for macOS"
  homepage "https://github.com/frostymur/aerofi"
  license "MIT"

  if Hardware::CPU.arm?
    url "https://github.com/frostymur/aerofi/releases/download/v0.2.1/aerofi-mac-arm64.tar.gz"
    sha256 "5d37ae8d216e05e099b1f085490938df48d4754e8995d36be9a847d0064c1745"
  else
    url "https://github.com/frostymur/aerofi/releases/download/v0.2.1/aerofi-mac-x86_64.tar.gz"
    sha256 "2ab69f325fa9117f2abcabc06005b4c80b7a883f83e589d87adc40832f249904"
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
