cask "gapless-paste" do
  version "0.3.0"
  sha256 "1f4bb45a1249773fde478660f89902694bdff78fe43f399475e548d055608e88"

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
