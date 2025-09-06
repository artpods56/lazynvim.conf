### My LazyVim config

This is my own lazyvim config that im using right now.

#### Neovim Manager - [bob](https://github.com/MordechaiHadad/bob)
Im personaly a big fan of bob, it manages my neovim installation really well.

Im usually working on MacOS/Linux but the installation process should be fairly similiar, you should probably check bob's readme anyway.

```bash
wget https://github.com/MordechaiHadad/bob/releases/download/v4.1.2/bob-macos-x86_64.zip
unzip -j bob-macos-x86_64.zip
chmod +x bob
mv bob ~/.local/bin/
bob
```

#### Neovim Installation
This is fairly easy, just run `bob install stable` at it will download, install and configure the neovim for you.
You will probably have to create some blank files in `~/.config` directory, just read the logs.

#### Applying Configuration
Remember to backup your current config because this from now on, anything can happen.
These steps assumes that you moved your nvim config from the `~/.config` directory.

```bash
cd ~/.config
git clone https://github.com/artpods56/lazynvim.conf
mv lazyvim.conf nvim
```

All done, LazyVim should bootstrap itself and load all the plugins.

#### Structure

```
~/.config/nvim
├── init.lua                 # sets leaders and loads lazy
├── lua
│   ├── config
│   │   ├── lazy.lua         # bootstrap lazy.nvim + plugin spec imports
│   │   ├── options.lua       # editor options
│   │   ├── keymaps.lua       # base keymaps
│   │   └── autocmds.lua      # generic autocmds
│   └── plugins              # plugin specs 
│       ├── core.lua          # colorscheme and LazyVim opts
│       ├── ui.lua            # theme plugins
│       └── disabled.lua      # disabled plugins
└── README.md
```
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

