class Aeroflow < Formula
  desc "Lightweight, config-driven tiling window manager for macOS"
  homepage "https://github.com/frostymur/OmniWM"
  license "GPL-2.0-only"

  depends_on "swift" => :build

  on_macos do
    on_arm do
      url "https://github.com/frostymur/OmniWM/archive/refs/tags/v0.7.3.tar.gz"
      sha256 "2ddc995c92240043bfdc68db54f36902ae4bc62428d61bfea3f4bc6c011c8485"
    end
  end

  def install
    system "swift", "build", "-c", "release", "--arch", "arm64"
    rel = Pathname.new(
      Utils.safe_popen_read(
        "swift", "build", "-c", "release", "--arch", "arm64", "--show-bin-path"
      ).chomp,
    )

    app = buildpath/"AeroFlow.app"
    rm_r(app)
    (app/"Contents/MacOS").mkpath
    (app/"Contents/Resources").mkpath
    (rel/"AeroFlow").install app/"Contents/MacOS/AeroFlow"
    (rel/"aeroflowctl").install app/"Contents/MacOS/aeroflowctl"
    (buildpath/"Info.plist").install app/"Contents/Info.plist"
    (rel/"AeroFlow_AeroFlow.bundle").cp_r app/"Contents/Resources/"

    # Ad-hoc sign so macOS gives the app a stable identity for TCC.
    system "codesign", "--force", "--sign", "-", app/"Contents/MacOS/aeroflowctl"
    system "codesign", "--force", "--sign", "-", app/"Contents/MacOS/AeroFlow"
    system "codesign", "--force", "--sign", "-", app

    prefix.install app
    ln_sf "../AeroFlow.app/Contents/MacOS/aeroflowctl", bin/"aeroflowctl"
  end

  service do
    run [opt_prefix/"AeroFlow.app/Contents/MacOS/AeroFlow"]
    keep_alive true
    process_type :interactive
  end

  def caveats
    <<~EOS
      AeroFlow controls windows through the macOS Accessibility API.

      1. Grant it access:
           System Settings -> Privacy & Security -> Accessibility
         (enable "AeroFlow", located at #{prefix}/AeroFlow.app)
      2. Start the daemon now and at every login:
           brew services start aeroflow

      AeroFlow is built from source and ad-hoc signed, so every upgrade
      is a new binary as far as macOS is concerned: if Accessibility
      stops working after 'brew upgrade aeroflow', toggle it off and
      back on in the Accessibility list.

      Configuration: ~/.config/aeroflow/settings.toml
      CLI:           aeroflowctl (installed into your PATH)
    EOS
  end

  test do
    # 'help' is a local action; it must work without a running daemon.
    output = shell_output("#{bin}/aeroflowctl help").chomp
    assert_match(/aeroflowctl/, output)
  end
end
