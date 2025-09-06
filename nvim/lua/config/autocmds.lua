-- Place small, generic autocmds here.

local group = vim.api.nvim_create_augroup("UserConfig", { clear = true })

-- Resize splits when window size changes
vim.api.nvim_create_autocmd("VimResized", {
  group = group,
  callback = function()
    vim.cmd("tabdo wincmd =")
  end,
})

