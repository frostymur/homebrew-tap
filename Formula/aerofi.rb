class Aerofi < Formula
  desc "Lightweight, keyboard- and mouse-driven script launcher for macOS"
  homepage "https://github.com/frostymur/aerofi"
  license "MIT"

  if Hardware::CPU.arm?
    url "https://github.com/frostymur/aerofi/releases/download/v0.2.6/aerofi-mac-arm64.tar.gz"
    sha256 "dcffd5f5f4941ccca7624b75685196b132274c73ca0080d68e368699d1dbe19e"
  else
    url "https://github.com/frostymur/aerofi/releases/download/v0.2.6/aerofi-mac-x86_64.tar.gz"
    sha256 "b08721a44f644877cad7b5af28aab6c53388b40bcdefa9a018093db22fdb7bb9"
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
