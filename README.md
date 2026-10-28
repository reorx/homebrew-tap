# homebrew-tap

Personal Homebrew tap for [reorx](https://github.com/reorx)'s apps.

## Usage

```bash
brew install --cask reorx/tap/mdnotate
```

Or tap first:

```bash
brew tap reorx/tap
brew install --cask mdnotate
```

Homebrew 7 only loads casks from non-official taps after they are trusted. If `brew install` refuses to load the cask, run:

```bash
brew trust --tap reorx/tap
```

## Casks

- [mdnotate](https://github.com/reorx/mdnotate) — Read-only Markdown reader with text annotation and quote export
- [feishu-lite](https://github.com/reorx/feishu-lite) — Lightweight Feishu chat client
- [gapless-paste](https://github.com/reorx/gapless-paste) — Menu bar tool to send clipboard images, files and text to SSH hosts
- [agent-session-manager](https://github.com/reorx/agent-session-manager) — Browse, search and resume Claude Code sessions (Apple Silicon)

## Maintenance

Casks are rendered and pushed by each app's release workflow when a `v*` tag is published, using a per-app write deploy key on this repository. Don't edit `version` / `sha256` by hand.
