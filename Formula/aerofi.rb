class Aerofi < Formula
  desc "Lightweight, keyboard- and mouse-driven script launcher for macOS"
  homepage "https://github.com/frostymur/aerofi"
  license "MIT"

  if Hardware::CPU.arm?
    url "https://github.com/frostymur/aerofi/releases/download/v0.2.32/aerofi-mac-arm64.tar.gz"
    sha256 "3b266f66ace3715c4bc92ed118301cf166ca617033de2059ec3cbfc9c02d628c"
  else
    url "https://github.com/frostymur/aerofi/releases/download/v0.2.32/aerofi-mac-x86_64.tar.gz"
    sha256 "abc1146e1c3ce39143e89ab503b2a8cc4208b5f8d645af35a0cf5e83ea537445"
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
