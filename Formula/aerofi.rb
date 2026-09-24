class Aerofi < Formula
  desc "Lightweight, keyboard- and mouse-driven script launcher for macOS"
  homepage "https://github.com/frostymur/aerofi"
  license "MIT"

  if Hardware::CPU.arm?
    url "https://github.com/frostymur/aerofi/releases/download/v0.2.12/aerofi-mac-arm64.tar.gz"
    sha256 "e71b3bcc10ffea1c6dc940daf4f211f028be9b35c5dd0366fcb124d022a85941"
  else
    url "https://github.com/frostymur/aerofi/releases/download/v0.2.12/aerofi-mac-x86_64.tar.gz"
    sha256 "180619698817ebcb4a92446533324aa515e941ccfb5fe41527dddd918b626a4a"
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
