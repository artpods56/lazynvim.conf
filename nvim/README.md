### LazyVim Starter (Lean)

This is a clean, documented LazyVim setup you can use as a solid base. It trims unused plugins and avoids common pitfalls (like colorscheme + bufferline highlight issues).

#### Install

1) Backup your current config and link/copy this folder to `~/.config/nvim`.

```bash
mv ~/.config/nvim ~/.config/nvim.bak 2>/dev/null || true
cp -r /workspace/nvim ~/.config/nvim
```

2) Start Neovim. Lazy will bootstrap itself automatically.

#### Structure

```
~/.config/nvim
├── init.lua                  # sets leaders and loads lazy
├── lua
│   ├── config
│   │   ├── lazy.lua          # bootstrap lazy.nvim + plugin spec imports
│   │   ├── options.lua       # core editor options
│   │   ├── keymaps.lua       # minimal base keymaps
│   │   └── autocmds.lua      # small generic autocmds
│   └── plugins               # your plugin specs (one concern per file)
│       ├── core.lua          # colorscheme and LazyVim opts
│       ├── ui.lua            # bufferline, lualine, theme plugin
│       └── disabled.lua      # plugins disabled explicitly
└── README.md
```

#### Why this fixes your startup error

LazyVim’s built‑in `colorscheme.lua` sometimes overrides bufferline highlights in ways that break when themes/plugins change. This starter provides a minimal `bufferline` config and loads a theme plugin explicitly, avoiding the problematic highlight mutation path.

#### Best practices

- **One concern per file**: put each feature or plugin family in its own spec file in `lua/plugins/`.
- **Prefer `opts` over imperative config**: supply options tables; avoid calling setup twice.
- **Disable unused plugins**: use `lua/plugins/disabled.lua` with `{ name, enabled = false }` so Lazy keeps a clear record and you can re‑enable later.
- **Keep base config small**: general maps/options/autocmds only. Feature-specific settings live with their plugins.
- **Pin, then update intentionally**: keep `lazy-lock.json` in Git; update with `:Lazy sync` when you choose.
- **Test incrementally**: add one plugin at a time, start Neovim, and check `:checkhealth` and `:messages`.
- **Name consistently**: files like `ui.lua`, `lsp.lua`, `git.lua`, `coding.lua`, `tools.lua`.
- **Project overrides**: use a trusted `.lazy.lua` in a project root for local tweaks without touching global config.

#### Common tasks

- Add a plugin:

```lua
-- lua/plugins/git.lua
return {
  { "lewis6991/gitsigns.nvim", opts = { current_line_blame = true } },
}
```

- Disable a plugin:

```lua
-- lua/plugins/disabled.lua
return {
  { "some/unused.nvim", enabled = false },
}
```

- Change colorscheme:

```lua
-- lua/plugins/core.lua
return {
  { "folke/tokyonight.nvim", lazy = false, priority = 1000 },
  { "LazyVim/LazyVim", opts = { colorscheme = "tokyonight" } },
}
```

#### Troubleshooting

- Run `:checkhealth` and `:Lazy build` after upgrades.
- If UI looks wrong, try a different theme or comment bufferline temporarily.
- Clear compiled cache: remove `~/.local/share/nvim/lazy` and restart.

