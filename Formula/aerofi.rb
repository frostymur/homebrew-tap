class Aerofi < Formula
  desc "Lightweight, keyboard- and mouse-driven script launcher for macOS"
  homepage "https://github.com/frostymur/aerofi"
  license "MIT"

  if Hardware::CPU.arm?
    url "https://github.com/frostymur/aerofi/releases/download/v0.2.11/aerofi-mac-arm64.tar.gz"
    sha256 "8534ad7502fadbad83bab731a9ed8e91c8cf864c3c72147f80337f8906024965"
  else
    url "https://github.com/frostymur/aerofi/releases/download/v0.2.11/aerofi-mac-x86_64.tar.gz"
    sha256 "d8612748099c760603f93c825dd55fbf8e89bff4d5b71f4849752f2e11d61444"
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
