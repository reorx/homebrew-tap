cask "feishu-lite" do
  version "0.1.0"
  sha256 "55fea2c6e8672ffc9b11b09f8e00cf2b0e485116113ec533af24eff6f7a179bd"

  url "https://github.com/reorx/feishu-lite/releases/download/v#{version}/FeishuChat-#{version}.dmg"
  name "FeishuChat"
  desc "Lightweight Feishu chat client"
  homepage "https://github.com/reorx/feishu-lite"

  depends_on macos: :sonoma
  depends_on formula: "uv"
  depends_on formula: "git"

  app "FeishuChat.app"

  # Third-party tap Ruby hook: also runs on upgrade. Keep the Finder-visible path
  # stable even when a shell config customizes UV_TOOL_BIN_DIR.
  postflight do
    system_command "#{HOMEBREW_PREFIX}/opt/uv/bin/uv",
                   args: ["tool", "install", "--force", "--python", "3.12", "--",
                          "git+https://github.com/reorx/feishu-lite.git@51d99cc34d914575b43bd5f1c1cdafb82c2a1a1e#subdirectory=backend"],
                   env: { "UV_TOOL_BIN_DIR" => File.expand_path("~/.local/bin") },
                   must_succeed: true
  end

  caveats <<~EOS
    The Python backend is installed for the current user using uv.
    Installation and upgrades require access to GitHub and Python package sources.
    Quit FeishuChat before upgrading, then reopen it.
    Uninstalling the cask preserves your login, messages, mail and uv backend.
    To remove the backend separately: uv tool uninstall feishu-lite-backend
  EOS
end
