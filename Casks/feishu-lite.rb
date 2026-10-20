cask "feishu-lite" do
  version "0.2.0"
  sha256 "43181cd412c6a814d0e587b28b81e7efb50a8c29cf28ff12587ad1ddc7b08d64"

  url "https://github.com/reorx/feishu-lite/releases/download/v#{version}/FeishuLite-#{version}.dmg"
  name "FeishuLite"
  desc "Lightweight Feishu chat client"
  homepage "https://github.com/reorx/feishu-lite"

  depends_on macos: :sonoma
  depends_on formula: "uv"
  depends_on formula: "git"

  app "FeishuLite.app"

  # Third-party tap Ruby hook: also runs on upgrade. Keep the Finder-visible path
  # stable even when a shell config customizes UV_TOOL_BIN_DIR.
  postflight do
    system_command "#{HOMEBREW_PREFIX}/opt/uv/bin/uv",
                   args: ["tool", "install", "--force", "--python", "3.12", "--",
                          "git+https://github.com/reorx/feishu-lite.git@20a53c10bc3ca946674f14281c8d9891d96fe7ed#subdirectory=backend"],
                   env: { "UV_TOOL_BIN_DIR" => File.expand_path("~/.local/bin") },
                   must_succeed: true
  end

  caveats <<~EOS
    The Python backend is installed for the current user using uv.
    Installation and upgrades require access to GitHub and Python package sources.
    Quit both FeishuChat and FeishuLite before upgrading, then open FeishuLite.
    Upgrading from FeishuChat requires enabling notifications and login at startup again.
    Existing mail passwords may require Keychain authorization for the new app.
    Uninstalling the cask preserves your login, messages, mail and uv backend.
    To remove the backend separately: uv tool uninstall feishu-lite-backend
  EOS
end
