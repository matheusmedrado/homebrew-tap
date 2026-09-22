cask "orbit" do
  version "1.1.0"
  sha256 "a4ad5a0d03ed21f4f4b1794c60607bd49fe7710e31c75b496885efdc78a79b48"

  url "https://github.com/matheusmedrado/orbit/releases/download/v#{version}/Orbit-#{version}.dmg"
  name "Orbit"
  desc "Claude and Codex usage limits in the menu bar"
  homepage "https://github.com/matheusmedrado/orbit"

  depends_on macos: ">= :sonoma"

  app "Orbit.app"

  # Orbit isn't notarized, so clear the download quarantine flag.
  postflight do
    system_command "/usr/bin/xattr", args: ["-dr", "com.apple.quarantine", "#{appdir}/Orbit.app"]
  end

  uninstall quit: "com.matheusmedrado.orbit"

  zap trash: "~/Library/Preferences/com.matheusmedrado.orbit.plist"
end
