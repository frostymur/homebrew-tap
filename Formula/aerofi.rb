class Aerofi < Formula
  desc "Lightweight, keyboard- and mouse-driven script launcher for macOS"
  homepage "https://github.com/frostymur/aerofi"
  license "MIT"

  if Hardware::CPU.arm?
    url "https://github.com/frostymur/aerofi/releases/download/v0.2.30/aerofi-mac-arm64.tar.gz"
    sha256 "597acbe0c8eefacaeebfe3bd952c463183b5daf1f20bbefccc2655fe0d62564b"
  else
    url "https://github.com/frostymur/aerofi/releases/download/v0.2.30/aerofi-mac-x86_64.tar.gz"
    sha256 "8895a682ea279e7272433381dc4898aa08d2398783f8657edc78ca0bf10ff669"
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
