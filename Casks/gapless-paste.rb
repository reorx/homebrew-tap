cask "gapless-paste" do
  version "0.1.0"
  sha256 "c7adb7b5880560dcf2ba14c2a2d0ee349bccb8259cd0e83a3b3c5cff84908a36"

  # 私有仓库：经 GitHub API 带 token 下载（gh auth login 或 HOMEBREW_GITHUB_API_TOKEN）
  url "https://api.github.com/repos/reorx/gapless-paste/releases/assets/650199637",
      header: [
        "Accept: application/octet-stream",
        "Authorization: Bearer #{GitHub::API.credentials}",
      ]
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
