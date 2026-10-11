class Aerofi < Formula
  desc "Lightweight, keyboard- and mouse-driven script launcher for macOS"
  homepage "https://github.com/frostymur/aerofi"
  license "MIT"

  if Hardware::CPU.arm?
    url "https://github.com/frostymur/aerofi/releases/download/v0.2.24/aerofi-mac-arm64.tar.gz"
    sha256 "6386f68c72e5e501d60a159980b6b9de72e5c3e806ca5f3e73092f24bf5736b7"
  else
    url "https://github.com/frostymur/aerofi/releases/download/v0.2.24/aerofi-mac-x86_64.tar.gz"
    sha256 "0c85736e97a9e6417aaf8c121d04d8d84ec0ccb1328f4fac6a7f0d5dc4e6b90a"
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
