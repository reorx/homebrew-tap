cask "gapless-paste" do
  version "0.4.0"
  sha256 "74f90d643c3578d485fc69bf03e0bee3783b8b7867eb2da76d7b2b1961c0a181"

  url "https://github.com/reorx/gapless-paste/releases/download/v#{version}/GaplessPaste-#{version}.dmg"
  name "GaplessPaste"
  desc "Menu bar tool to send clipboard images, files and text to SSH hosts"
  homepage "https://github.com/reorx/gapless-paste"

  auto_updates true
  depends_on macos: :sonoma

  app "GaplessPaste.app"

  uninstall quit: "com.reorx.gaplesspaste"

  zap trash: [
    "~/Library/Application Support/GaplessPaste",
    "~/Library/Caches/GaplessPaste",
    "~/Library/Logs/GaplessPaste",
    "~/Library/Preferences/com.reorx.gaplesspaste.plist",
  ]
end
