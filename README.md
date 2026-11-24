# nvim-config

Personal Neovim configuration based on [LazyVim](https://github.com/LazyVim/LazyVim).
Includes language tooling for Go, Python, Rust, TypeScript, and Angular, plus AI integrations.

## Install on another machine

Install Neovim, Git, ripgrep, fd, a C compiler/build tools, and a Nerd Font.
Install the runtimes needed for your projects (for example Node.js/npm, Go,
Python, and Rust). Some plugins build native components using `make`.

If `~/.config/nvim` already exists, back it up before cloning.
Authenticate GitHub CLI for access to this private repository, then run:

```sh
gh repo clone Pheethy/nvim-config ~/.config/nvim
nvim
```

Allow Lazy to install plugins. Run `:Lazy restore` to use the versions recorded
in `lazy-lock.json`, then `:checkhealth` to identify missing tools.
Plugin downloads, language servers, and caches are installed separately on each
machine; they are not stored in this repository.

## AI credentials and optional tools

Set `ANTHROPIC_API_KEY` and/or `DEEPSEEK_API_KEY` in the environment before
starting Neovim if you use those providers. Never put real keys in tracked files.
Alternatively, create `~/.config/nvim/local-secrets.lua` (ignored by Git):

```lua
vim.env.ANTHROPIC_API_KEY = vim.env.ANTHROPIC_API_KEY or "YOUR_KEY_HERE"
vim.env.DEEPSEEK_API_KEY = vim.env.DEEPSEEK_API_KEY or "YOUR_KEY_HERE"
```

Protect that file with `chmod 600 ~/.config/nvim/local-secrets.lua`.
Copilot and Supermaven require their own authentication on each machine.
The terminal shortcuts for `pi` and `agy` require those CLIs to be installed.

## Updating

Commit and push config changes from one machine, then `git pull` on the others.
Commit `lazy-lock.json` when intentionally updating plugin versions.
Backup files and local credentials stay on the machine and are ignored by Git.
