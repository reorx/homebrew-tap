cask "gapless-paste" do
  version "0.1.1"
  sha256 "20042a0f80a110919d8b22906bc62a998e9deef1ff7fe990d50989990906f164"

  url "https://github.com/reorx/gapless-paste/releases/download/v#{version}/GaplessPaste-#{version}.dmg"
  name "GaplessPaste"
  desc "Menu bar tool to send clipboard images, files and text to SSH hosts"
  homepage "https://github.com/reorx/gapless-paste"

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
