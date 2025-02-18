-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
local map = vim.keymap.set

local quarto = require("quarto")
quarto.setup()
vim.keymap.set("n", "<leader>qp", quarto.quartoPreview, { silent = true, noremap = true })

-- neogit mappings
if vim.fn.executable("git") == 1 then
  map("n", "<leader>gg", function()
    require("neogit").open({ cwd = LazyVim.root.git() })
  end, { desc = "Neogit (Root Dir)" })
  map("n", "<leader>gG", function()
    require("neogit").open()
  end, { desc = "Neogit (cwd)" })
  map("n", "<leader>gf", function()
    require("neogit").open({ kind = "split" })
  end, { desc = "Git Current File Status" })
  map("n", "<leader>gl", function()
    require("neogit").open({ cwd = LazyVim.root.git(), kind = "tab" })
  end, { desc = "Git Log (Root Dir)" })
  map("n", "<leader>gL", function()
    require("neogit").open({ kind = "tab" })
  end, { desc = "Git Log (cwd)" })
end

map("n", "<leader>gb", function()
  require("neogit").open({ kind = "split" })
end, { desc = "Git Blame Line" })
map({ "n", "x" }, "<leader>gB", function()
  require("neogit").open({ kind = "vsplit" })
end, { desc = "Git Browse (open)" })
map({ "n", "x" }, "<leader>gY", function()
  local neogit = require("neogit")
  neogit.open({ cwd = vim.fn.expand("%:p:h") }) -- Open Neogit in file's directory
end, { desc = "Git Browse (copy URL)" })

-- molten mappings

vim.keymap.set("n", "<localleader>mi", ":MoltenInit<CR>", { silent = true, desc = "Initialize the plugin" })
vim.keymap.set("n", "<localleader>e", ":MoltenEvaluateOperator<CR>", { silent = true, desc = "run operator selection" })
vim.keymap.set("n", "<localleader>rl", ":MoltenEvaluateLine<CR>", { silent = true, desc = "evaluate line" })
vim.keymap.set("n", "<localleader>rr", ":MoltenReevaluateCell<CR>", { silent = true, desc = "re-evaluate cell" })
vim.keymap.set(
  "v",
  "<localleader>r",
  ":<C-u>MoltenEvaluateVisual<CR>gv",
  { silent = true, desc = "evaluate visual selection" }
)

vim.keymap.set("n", "<localleader>rd", ":MoltenDelete<CR>", { silent = true, desc = "molten delete cell" })
vim.keymap.set("n", "<localleader>oh", ":MoltenHideOutput<CR>", { silent = true, desc = "hide output" })
vim.keymap.set(
  "n",
  "<localleader>os",
  ":noautocmd MoltenEnterOutput<CR>",
  { silent = true, desc = "show/enter output" }
)

vim.keymap.set("i", "jk", "<esc>")
