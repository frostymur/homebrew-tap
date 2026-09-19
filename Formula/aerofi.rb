class Aerofi < Formula
  desc "Lightweight, keyboard- and mouse-driven script launcher for macOS"
  homepage "https://github.com/frostymur/aerofi"
  license "MIT"

  if Hardware::CPU.arm?
    url "https://github.com/frostymur/aerofi/releases/download/v0.2.1/aerofi-mac-arm64.tar.gz"
    sha256 "4149c9422499376a85ef4b0258f88894318ee971cd3621dead3165cd112723a6"
  else
    url "https://github.com/frostymur/aerofi/releases/download/v0.2.1/aerofi-mac-x86_64.tar.gz"
    sha256 "c3734bc0828adfdea16c6628a0683dbf8e1a3247865bffc64ed06c44acc9bddc"
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
