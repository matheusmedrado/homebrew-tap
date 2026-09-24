cask "summon" do
  version "1.0.3"
  sha256 "e086549cfc008062253b37a8d670e534d696589dc62710176c7d7bf18ebfb908"

  url "https://github.com/matheusmedrado/summon/releases/download/v#{version}/Summon-#{version}.dmg"
  name "Summon"
  desc "Global hotkeys and key remapping in the menu bar"
  homepage "https://github.com/matheusmedrado/summon"

  depends_on macos: :sonoma

  app "Summon.app"

  # Summon isn't notarized, so clear the download quarantine flag.
  postflight_steps do
    run "/usr/bin/xattr", args: ["-dr", "com.apple.quarantine", "{{appdir}}/Summon.app"]
  end

  uninstall launchctl: "com.matheusmedrado.summon",
            quit:      "com.matheusmedrado.summon"

  zap trash: [
    "~/.config/summon",
    "~/Library/Logs/Summon.log",
    "~/Library/Preferences/com.matheusmedrado.summon.plist",
  ]
end
