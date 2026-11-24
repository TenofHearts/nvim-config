# Personal Neovim configuration

In Normal mode, press `Space` to see shortcut hints. Use `Space sk` to search
keymaps or `Space sh` to search help. New to Neovim? Run `:Tutor` for an
interactive introduction.

Files are formatted on save. Use `:ConformInfo` to see the formatter for the current file and `:Mason` to check language tools.

For C/C++, give clangd a `compile_commands.json` so it uses your project's
compiler flags. A project `.clang-format` or `_clang-format` overrides the
[fallback style](formatters/clang-format.yaml). Python uses Black and Pyright,
which picks up a `.venv` at the project root. In Cargo projects, Rust uses
rustfmt and runs Clippy checks on save.

Based on [Kickstart.nvim](https://github.com/nvim-lua/kickstart.nvim) ([license](LICENSE.md)).
