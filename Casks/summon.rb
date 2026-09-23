cask "summon" do
  version "1.0.0"
  sha256 "05772671e8f699517b139d92df7823b49dd4875e4ad1405bb215be304d39f764"

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
