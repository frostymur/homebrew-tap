class Aerofi < Formula
  desc "Lightweight, keyboard- and mouse-driven script launcher for macOS"
  homepage "https://github.com/frostymur/aerofi"
  license "MIT"

  if Hardware::CPU.arm?
    url "https://github.com/frostymur/aerofi/releases/download/v0.2.27/aerofi-mac-arm64.tar.gz"
    sha256 "d1a639c6e223a1cf06f3dcea0e2a5a207bfe18c021c14524c9c87904a9d7a546"
  else
    url "https://github.com/frostymur/aerofi/releases/download/v0.2.27/aerofi-mac-x86_64.tar.gz"
    sha256 "4002acf6bd30b0a5d7c4a09cd7543a02c796a12df8a6b46ba0338e20bf07b95d"
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
