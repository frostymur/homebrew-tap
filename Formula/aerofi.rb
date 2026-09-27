class Aerofi < Formula
  desc "Lightweight, keyboard- and mouse-driven script launcher for macOS"
  homepage "https://github.com/frostymur/aerofi"
  license "MIT"

  if Hardware::CPU.arm?
    url "https://github.com/frostymur/aerofi/releases/download/v0.2.22/aerofi-mac-arm64.tar.gz"
    sha256 "65f736777c69cd484db2a57857fea3aa459178a2112ea8e33786630da2ec5aeb"
  else
    url "https://github.com/frostymur/aerofi/releases/download/v0.2.22/aerofi-mac-x86_64.tar.gz"
    sha256 "08908748ea5731d40c06babf34bf521fe876b59df8053217710aad5453266216"
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
