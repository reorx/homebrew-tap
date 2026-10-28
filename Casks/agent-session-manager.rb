cask "agent-session-manager" do
  version "1.0.0"
  sha256 "09ffd65fb99442565d1b7911bf0b10b5df8e3f8451b1979d2a3b3a6aab9ec1ec"

  url "https://github.com/reorx/agent-session-manager/releases/download/v#{version}/AgentSessionManager-#{version}.dmg"
  name "Agent Session Manager"
  desc "Browse, search and resume Claude Code sessions"
  homepage "https://github.com/reorx/agent-session-manager"

  livecheck do
    url :url
    strategy :github_latest
  end

  auto_updates true
  depends_on arch: :arm64
  depends_on macos: :sonoma

  app "Agent Session Manager.app"

  uninstall quit: "com.reorx.agent-session-manager"

  zap trash: [
    "~/Library/Application Support/dev.reorx.AgentSessionManager",
    "~/Library/Caches/com.reorx.agent-session-manager",
    "~/Library/HTTPStorages/com.reorx.agent-session-manager",
    "~/Library/Preferences/com.reorx.agent-session-manager.plist",
    "~/Library/Saved Application State/com.reorx.agent-session-manager.savedState",
  ]
end
