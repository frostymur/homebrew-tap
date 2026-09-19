class Aerofi < Formula
  desc "Lightweight, keyboard- and mouse-driven script launcher for macOS"
  homepage "https://github.com/frostymur/aerofi"
  license "MIT"

  if Hardware::CPU.arm?
    url "https://github.com/frostymur/aerofi/releases/download/v0.2.3/aerofi-mac-arm64.tar.gz"
    sha256 "3a4ff0a0fbda361cd3547cedb05f91913c43e0263cd17fc3f17be888cd6c104a"
  else
    url "https://github.com/frostymur/aerofi/releases/download/v0.2.3/aerofi-mac-x86_64.tar.gz"
    sha256 "83a3fedf981d40dd3c828a6a1f0b33d3aa308e1476003da900f09068e6f1651d"
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
