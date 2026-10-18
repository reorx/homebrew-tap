cask "feishu-lite" do
  version "0.1.2"
  sha256 "3d9221cab2f8ce892826a28271247d45e2c7d7cbfe773dd3c790078a4b08044d"

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
                          "git+https://github.com/reorx/feishu-lite.git@ba1de6cbf128a038e42d4ad361c80cc827b20dbb#subdirectory=backend"],
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
