-- Entry point for Neovim using LazyVim
-- Keeps this repo self-contained and easy to expand.

-- Leader must be set before loading lazy.nvim
vim.g.mapleader = " "
vim.g.maplocalleader = ","

-- Load core options/keymaps/autocmds and bootstrap lazy.nvim
require("config.lazy")

