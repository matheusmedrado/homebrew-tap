cask "summon" do
  version "1.0.2"
  sha256 "4fcaeeccc90b38d9da98c2b5ec1dbb36c89d9d30cd7fe1b0ffa071ff68c2df5c"

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
