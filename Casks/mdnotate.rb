cask "mdnotate" do
  version "0.5.1"
  sha256 "364d3428e0fa86389b1575e8fc05f21de72b564d22198127c399a7782ee0b139"

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
