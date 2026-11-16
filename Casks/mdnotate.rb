cask "mdnotate" do
  version "0.16.0"
  sha256 "6b5ddbe215679afe886221cc69d811a9c98ec2f99ba557a0a7b4aa2e4c7f7792"

  url "https://github.com/reorx/mdnotate/releases/download/v#{version}/mdnotate_#{version}_universal.dmg"
  name "mdnotate"
  desc "Read-only Markdown reader with text annotation and quote export"
  homepage "https://github.com/reorx/mdnotate"

  livecheck do
    url :url
    strategy :github_latest
  end

  app "mdnotate.app"

  zap trash: [
    "~/Library/Application Support/top.ideachat.mdnotate",
    "~/Library/Caches/top.ideachat.mdnotate",
    "~/Library/Preferences/top.ideachat.mdnotate.plist",
    "~/Library/Saved Application State/top.ideachat.mdnotate.savedState",
    "~/Library/WebKit/top.ideachat.mdnotate",
  ]
end
