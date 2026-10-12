class Aeroflow < Formula
  desc "Lightweight, config-driven tiling window manager for macOS"
  homepage "https://github.com/frostymur/OmniWM"
  url "https://github.com/frostymur/OmniWM/releases/download/v0.7.4/AeroFlow-v0.7.4.zip"
  version "0.7.4"
  sha256 "3c522e03a0ce83ea95a33a59a862d4c8d81c64aa169b24f0bf9b23de383febe0"
  license "GPL-2.0-only"

  livecheck do
    url "https://api.github.com/repos/frostymur/OmniWM/releases/latest"
    match(/tag_name[":=\s]+v?(\d+(?:\.\d+)+)/i)
  end

  # Prebuilt arm64 binary; deployment target is macOS 15 (Sequoia).
  # Tested on Sequoia and Tahoe (macOS 26). No toolchain required.
  depends_on :arm64
  depends_on macos: :sequoia

  def install
    # The release archive contains the ad-hoc-signed AeroFlow.app. The bundle
    # carries the stable TCC identity (bundle ID) and the onboarding window;
    # the daemon and CLI live inside it.
    app = buildpath/"AeroFlow.app"
    prefix.install app
    # Relative to bin/, the ctl sits inside the app bundle at the prefix root.
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
      It is ad-hoc signed, so macOS treats every release as a new binary:
      if Accessibility stops working after `brew upgrade aeroflow`,
      toggle it off and back on in the Accessibility list.

      1. Grant it access (first launch shows an onboarding window):
           System Settings -> Privacy & Security -> Accessibility
         (enable "AeroFlow")
      2. Start the daemon now and at every login:
           brew services start aeroflow

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
