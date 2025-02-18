return {
  "folke/which-key.nvim",
  event = "VeryLazy",
  opts = {
    -- config
  },
  keys = {
    { "<localleader>q", group = "quarto" },
    { "<localleader>qp", "<cmd>QuartoPreview<cr>", desc = "QuartoPreview" },
  },
}
