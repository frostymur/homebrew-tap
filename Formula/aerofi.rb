class Aerofi < Formula
  desc "Lightweight, keyboard- and mouse-driven script launcher for macOS"
  homepage "https://github.com/frostymur/aerofi"
  license "MIT"

  if Hardware::CPU.arm?
    url "https://github.com/frostymur/aerofi/releases/download/v0.2.9/aerofi-mac-arm64.tar.gz"
    sha256 "645a16c6a36c3816722c9d7fcd2bafe45fb22775eccba34f91b306ad8a06f6d1"
  else
    url "https://github.com/frostymur/aerofi/releases/download/v0.2.9/aerofi-mac-x86_64.tar.gz"
    sha256 "a5f334d81f543ead1a27f59bad25e205738794887f5242fc795ff923884fe42b"
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
