class Aerofi < Formula
  desc "Lightweight, keyboard- and mouse-driven script launcher for macOS"
  homepage "https://github.com/frostymur/aerofi"
  license "MIT"

  if Hardware::CPU.arm?
    url "https://github.com/frostymur/aerofi/releases/download/v0.2.28/aerofi-mac-arm64.tar.gz"
    sha256 "5e43e9b59a41faa56ef131aebdde473ef6153828ecd5188d3203a48a6a97b99e"
  else
    url "https://github.com/frostymur/aerofi/releases/download/v0.2.28/aerofi-mac-x86_64.tar.gz"
    sha256 "3ad5473f27fd2e105f3820ed72846c242c1c2bf5b87d5e151e0f28667390b47f"
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
