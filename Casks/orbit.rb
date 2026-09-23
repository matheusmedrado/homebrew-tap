cask "orbit" do
  version "1.1.1"
  sha256 "690ab5cc536a06ccc90d2afb152a11b6eabf36fa1bb70ad18994fbc903924ed6"

  url "https://github.com/matheusmedrado/orbit/releases/download/v#{version}/Orbit-#{version}.dmg"
  name "Orbit"
  desc "Claude and Codex usage limits in the menu bar"
  homepage "https://github.com/matheusmedrado/orbit"

  depends_on macos: :sonoma

  app "Orbit.app"

  # Orbit isn't notarized, so clear the download quarantine flag.
  postflight_steps do
    run "/usr/bin/xattr", args: ["-dr", "com.apple.quarantine", "{{appdir}}/Orbit.app"]
  end

  uninstall quit: "com.matheusmedrado.orbit"

  zap trash: "~/Library/Preferences/com.matheusmedrado.orbit.plist"
end
