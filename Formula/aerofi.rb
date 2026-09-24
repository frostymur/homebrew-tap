class Aerofi < Formula
  desc "Lightweight, keyboard- and mouse-driven script launcher for macOS"
  homepage "https://github.com/frostymur/aerofi"
  license "MIT"

  if Hardware::CPU.arm?
    url "https://github.com/frostymur/aerofi/releases/download/v0.2.15/aerofi-mac-arm64.tar.gz"
    sha256 "752c4b4063dadbd88e9845982efee87bdaec5ce5db6c878ba5e16f4e627ee72d"
  else
    url "https://github.com/frostymur/aerofi/releases/download/v0.2.15/aerofi-mac-x86_64.tar.gz"
    sha256 "567b8033bba52d0470a4a6f505e3f71339ac939f585c3982ae0707a2cfb9752e"
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
