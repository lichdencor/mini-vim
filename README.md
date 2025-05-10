# mini-vim

Minimal yet powerful Vim configuration with essential development tools: navigation, autocompletion, linting, and LSP.

## Features

- **Basic Configs**
  - Syntax highlighting and filetype-based indentation
  - Line numbers and 4-space tabs with soft tabs (expandtab)

- **Plugin Manager**
  - Uses [vim-plug](https://github.com/junegunn/vim-plug)

- **Directory Navigation**
  - `vim-vinegar` for quick file exploration

- **Fuzzy Finder**
  - `fzf` and `fzf.vim` for fast file/buffer/grep navigation

- **Linting and Fixing**
  - `ALE` with support for:
    - Python (`pylint`)
    - JavaScript (`eslint`)
    - TypeScript (`tsserver`)
    - C/C++ (`clangd`, with `clang-format` fixer)
    - Arduino (optional)

- **Autocomplete**
  - `asyncomplete.vim` and `asyncomplete-lsp.vim`

- **LSP (Language Server Protocol)**
  - `vim-lsp` and `vim-lsp-settings`
  - Configured for:
    - TypeScript/JavaScript
    - C/C++
    - Rust
    - Arduino (commented but included)

## Installation

1. Install [vim-plug](https://github.com/junegunn/vim-plug)
2. Clone this repo or copy `vimrc` to your `~/.vimrc`
3. Open Vim and run:

   ```vim
   :PlugInstall
   ```

4. Make sure your language servers (like `clangd`, `typescript-language-server`, etc.) are installed and in `$PATH`.

## Keybindings

- **Navigation**
  - `<leader>e` - Open Netrw Explorer
  - `<leader>f` - Alias to `:Ex`
  - `<leader>u` - Go up one directory (in netrw)
  - `<leader>r` - Reload directory
  - `<leader>q` - Close Explorer

- **fzf**
  - `<C-p>` - Search files
  - `<C-b>` - Search buffers
  - `<C-f>` - Ripgrep (project-wide text search)

- **Autocomplete**
  - `<Tab>` / `<S-Tab>` to navigate suggestions
  - `<Enter>` to confirm

## Notes

- ALE is configured to fix files on save.
- LSP logging is enabled: see `~/.vim/lsp.log`
- Arduino LSP support requires:
  - `arduino-language-server`
  - `arduino-cli`
  - Adjust `fqbn` and CLI config path as needed

---

### Example Folder Structure

```
~/.vim/
├── plugged/
└── vimrc  (or link from mini-vim repo)
```

## Tip

Use `vim -u ~/.vimrc` to test this config without affecting others.

---
