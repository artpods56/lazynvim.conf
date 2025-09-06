-- Minimal UI layer to avoid colorscheme/bufferline issues.

return {
  -- Theme plugins you actually use
  { "folke/tokyonight.nvim", lazy = false, priority = 1000 },

  -- Bufferline with a safe, minimal setup
  {
    "akinsho/bufferline.nvim",
    event = "VeryLazy",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    opts = function()
      return {
        options = {
          diagnostics = "nvim_lsp",
          always_show_bufferline = true,
          offsets = {
            { filetype = "neo-tree", text = "Explorer", separator = true, text_align = "left" },
          },
        },
        -- Override any upstream LazyVim highlight function with a no-op to
        -- avoid colorscheme.lua integration issues
        highlights = function()
          return {}
        end,
      }
    end,
    config = function(_, opts)
      -- Explicitly setup bufferline ourselves to avoid upstream config side-effects
      require("bufferline").setup(opts)
    end,
  },

  -- Statusline
  {
    "nvim-lualine/lualine.nvim",
    event = "VeryLazy",
    opts = { options = { theme = "auto", globalstatus = true } },
  },
}

