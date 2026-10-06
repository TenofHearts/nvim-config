# Personal Neovim configuration

Shared configuration for macOS, Linux and Windows, based on [Kickstart.nvim](https://github.com/nvim-lua/kickstart.nvim). The upstream license is retained in LICENSE.md.

Requires Neovim 0.12+, Git, ripgrep and fd. Pyright needs Node/npm. A Nerd Font is enabled; set `vim.g.have_nerd_font = false` if unavailable. A C compiler and make enable Telescope's optional native extension.

## Install

For macOS and Linux, clone to `${XDG_CONFIG_HOME:-$HOME/.config}/nvim`, backing up any existing configuration first. On Windows, clone to `$env:LOCALAPPDATA/nvim` in PowerShell. This repository can also be included as a submodule in another dotfiles repository and linked to those locations.

Start `nvim` to install the pinned plugins. Mason installs Pyright, Black and clang-format, and clangd if absent. Install a minimal stable Rust toolchain with rustup, then add `rust-analyzer rust-src rustfmt clippy`; put Rust tools on PATH. Compilers are installed separately. The macOS parent dotfiles bootstrap handles dependencies and Rust components.

## Preferences

- Relative line numbers, with the actual number on the current line.
- Tokyo Night, icons, Git indicators, shortcut hints, persistent undo and system clipboard.
- Enter accepts a completion when its menu is visible; otherwise it inserts a newline. Up/Down or Ctrl-N/Ctrl-P select; Ctrl-Space opens the menu; Ctrl-E dismisses it.
- Automatic pairing for brackets and quotes.
- `Space e` toggles the file tree; `\` reveals the current file; `Space sf` searches files; `Space sg` searches text.
- `Space f` formats manually; formatting also runs on save.
- C/C++: VS Code C/C++ extension's documented Visual Studio fallback style: four spaces, Allman block braces, and no column limit. Formatting preserves existing expression line breaks rather than wrapping based on width. Project clang-format files take precedence over `formatters/clang-format.yaml`.
- Python: Pyright basic checks, project `.venv` detection, and Black defaults.
- Rust: rust-analyzer, Clippy checks on save, and rustfmt defaults.

Language settings live in `lua/custom/languages.lua`. C/C++ projects should provide `compile_commands.json`; Rust projects should have `Cargo.toml`. Use `:Tutor` for basics, `:Mason` for tools and `:ConformInfo` for formatter status.

## Storage and updates

Track configuration and `nvim-pack-lock.json` here. Plugins and Mason tools use `stdpath('data')`; logs and undo history use `stdpath('state')`; caches use `stdpath('cache')`. These remain local, outside this repository. Project configuration may override formatter defaults.

Review plugin updates with `:lua vim.pack.update()` and apply with `:write` in its review buffer. Commit the resulting lockfile. If this repository is a submodule, commit and push changes here first, then commit its updated reference in the parent dotfiles repository. Each parent pins a specific commit; updates are deliberate.
