class Aerofi < Formula
  desc "Lightweight, keyboard- and mouse-driven script launcher for macOS"
  homepage "https://github.com/frostymur/aerofi"
  license "MIT"

  if Hardware::CPU.arm?
    url "https://github.com/frostymur/aerofi/releases/download/v0.2.31/aerofi-mac-arm64.tar.gz"
    sha256 "0b5aaa4e04f346833e1dd6f959421be179d741e7f2902d18210b4cf1b2678890"
  else
    url "https://github.com/frostymur/aerofi/releases/download/v0.2.31/aerofi-mac-x86_64.tar.gz"
    sha256 "53b138844dbb440656151e5f224d560110d5578c32f6ea0286f047fd6c1da055"
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
