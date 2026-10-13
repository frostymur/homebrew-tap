class Aeroflow < Formula
  desc "Lightweight, config-driven tiling window manager for macOS"
  homepage "https://github.com/frostymur/OmniWM"
  url "https://github.com/frostymur/OmniWM/releases/download/v0.7.6/AeroFlow-v0.7.6.zip"
  version "0.7.6"
  sha256 "7e61e6d7190c95b8f8e4ef7ee70c8d6a1163aecb308c4d518557aa9ea85eae4c"
  license "GPL-2.0-only"

  livecheck do
    # url-only: the :github_api default strategy reads tag_name from the
    # releases API. (url exists in every Livecheck DSL revision; match/regex
    # do not.)
    url "https://api.github.com/repos/frostymur/OmniWM/releases/latest"
  end

  def install
    # The release archive contains the ad-hoc-signed AeroFlow.app. The bundle
    # carries the stable TCC identity (bundle ID) and the onboarding window;
    # the daemon and CLI live inside it. Depending on the Homebrew revision,
    # the archive's single top-level dir may itself be buildpath (newer) or
    # sit at buildpath/AeroFlow.app (older) — handle both.
    if (buildpath/"AeroFlow.app/Contents/MacOS/AeroFlow").exist?
      app_dir = buildpath/"AeroFlow.app"
    elsif (buildpath/"Contents/MacOS/AeroFlow").exist?
      app_dir = buildpath
    else
      raise "AeroFlow.app not found in buildpath #{buildpath}; " \
            "contents: #{Dir[buildpath.to_s + "/*"].inspect}"
    end
    prefix.mkpath
    cp_r app_dir, prefix/"AeroFlow.app"
    # This Homebrew revision seeds a .brew_home inside buildpath, which
    # for single-top-level archives is the bundle itself; don't ship it.
    rm_rf prefix/"AeroFlow.app/.brew_home"
    # Relative to bin/, the ctl sits inside the app bundle at the prefix root.
    bin.mkpath
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
