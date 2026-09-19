class Aerofi < Formula
  desc "Lightweight, keyboard- and mouse-driven script launcher for macOS"
  homepage "https://github.com/frostymur/aerofi"
  license "MIT"

  if Hardware::CPU.arm?
    url "https://github.com/frostymur/aerofi/releases/download/v0.2.0/aerofi-mac-arm64.tar.gz"
    sha256 "cd5e0fa9ecc64fc93968856feadc671c37a79cf80504ff37af30468021cc108f"
  else
    url "https://github.com/frostymur/aerofi/releases/download/v0.2.0/aerofi-mac-x86_64.tar.gz"
    sha256 "9196f3a4209f159d7487b15fe2232383910ad783685b6d0a98b7811161c67fd8"
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
