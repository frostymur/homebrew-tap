class Aeroflow < Formula
  desc "Lightweight, config-driven tiling window manager for macOS"
  homepage "https://github.com/frostymur/OmniWM"
  license "GPL-2.0-only"

  # Builds with the system toolchain (Xcode or Command Line Tools).
  # Homebrew's standalone Swift lacks xcstringstool, which SwiftPM needs
  # to process the .xcstrings localization resources.

  on_macos do
    on_arm do
      url "https://github.com/frostymur/OmniWM/archive/refs/tags/v0.7.4.tar.gz"
      sha256 "3823bd244d73d91f5bcd8643f42a4c532fa958f0bd329185e50e6a8bc07a6ec3"
    end
  end

  def install
    # System toolchain (see class comment): brew's standalone Swift lacks
    # xcstringstool, so a Homebrew `swift` earlier on the PATH would break
    # the build.
    swift = "/usr/bin/swift"
    unless File.exist?(swift)
      odie "System Swift toolchain not found. Install Xcode Command Line Tools first: xcode-select --install"
    end
    system swift, "build", "-c", "release", "--arch", "arm64", "--disable-sandbox"
    rel = Pathname.new(
      Utils.safe_popen_read(
        swift, "build", "-c", "release", "--arch", "arm64", "--disable-sandbox", "--show-bin-path"
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
      It requires macOS 15 (Sequoia) or later and is built for Apple
      Silicon; tested on Sequoia and Tahoe (macOS 26).

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
