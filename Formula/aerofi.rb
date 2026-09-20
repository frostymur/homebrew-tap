class Aerofi < Formula
  desc "Lightweight, keyboard- and mouse-driven script launcher for macOS"
  homepage "https://github.com/frostymur/aerofi"
  license "MIT"

  if Hardware::CPU.arm?
    url "https://github.com/frostymur/aerofi/releases/download/v0.2.8/aerofi-mac-arm64.tar.gz"
    sha256 "c7a4f3d6c9f3d949eca6947f3f36945320f11962c594d1264c5b8fb56c2b5aac"
  else
    url "https://github.com/frostymur/aerofi/releases/download/v0.2.8/aerofi-mac-x86_64.tar.gz"
    sha256 "b16daf90e523f9f2c3b38470685065c4ba3c85f7b37b36e54980cf66bd743821"
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
