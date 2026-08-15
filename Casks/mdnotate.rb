cask "mdnotate" do
  version "0.5.0"
  sha256 "5367298e90ec5056daa4b7b93ba22ddbdf1456d9676cf6d818432571a3f5c1ff"

  url "https://github.com/reorx/mdnotate/releases/download/v#{version}/mdnotate_#{version}_universal.dmg"
  name "mdnotate"
  desc "Read-only Markdown reader with text annotation and quote export"
  homepage "https://github.com/reorx/mdnotate"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on macos: :catalina

  app "mdnotate.app"

  zap trash: [
    "~/Library/Application Support/top.ideachat.mdnotate",
    "~/Library/Caches/top.ideachat.mdnotate",
    "~/Library/Preferences/top.ideachat.mdnotate.plist",
    "~/Library/Saved Application State/top.ideachat.mdnotate.savedState",
    "~/Library/WebKit/top.ideachat.mdnotate",
  ]
end
