-- Basic keymaps. Keep minimal; feature maps belong with their plugins.

local map = vim.keymap.set

map("n", "<leader>qq", ":qa<cr>", { desc = "Quit all" })

--- Neogit --- /plugins/essentials.lua

map("n", "<leader>gg", function()
	require("neogit").open({ cwd = LazyVim.root.git() })
end, { desc = "Neogit (Root Dir)" })
