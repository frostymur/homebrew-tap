class Aerofi < Formula
  desc "Lightweight, keyboard- and mouse-driven script launcher for macOS"
  homepage "https://github.com/frostymur/aerofi"
  license "MIT"

  if Hardware::CPU.arm?
    url "https://github.com/frostymur/aerofi/releases/download/v0.2.2/aerofi-mac-arm64.tar.gz"
    sha256 "debed4a6c42aab35ae27d64e771918a2beffa185527f99ab24a5d72ef2e1d93f"
  else
    url "https://github.com/frostymur/aerofi/releases/download/v0.2.2/aerofi-mac-x86_64.tar.gz"
    sha256 "059dc63bfd9940e49de9822174023192da6ce2679b983668e902665894d44bc6"
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
