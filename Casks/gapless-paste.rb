cask "gapless-paste" do
  version "0.2.0"
  sha256 "be7dcd5c6cdb87447f2391117388be6d0ad130fe19594796ccb6ec1d60b86d90"

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
