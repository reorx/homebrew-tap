cask "mdnotate" do
  version "0.10.0"
  sha256 "9105bce1f2a5cdb626d187b827e6867da018a51ef3f31c65d27ff2e90269c09c"

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
