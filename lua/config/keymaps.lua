-- Basic keymaps. Keep minimal; feature maps belong with their plugins.

local map = vim.keymap.set

map("n", "<leader>qq", ":qa<cr>", { desc = "Quit all" })

