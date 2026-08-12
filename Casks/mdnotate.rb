cask "mdnotate" do
  version "0.3.0"
  sha256 "d1f9405bff7354b0e258a871b31038d4b75f918e920e19c7f9d842713ab44b3b"

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
