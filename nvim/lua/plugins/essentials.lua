-- Essentials: treesitter, LSP base, formatting, finder

return {
  -- Treesitter
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    opts = {
      highlight = { enable = true },
      indent = { enable = true },
      ensure_installed = { "lua", "vim", "vimdoc", "bash", "markdown", "markdown_inline", "json", "yaml", "toml" },
    },
  },

  -- LSP config (LazyVim will install mason & base servers)
  { "neovim/nvim-lspconfig" },

  -- Formatting & linting via conform and nvim-lint (already in LazyVim but ok to keep)
  { "stevearc/conform.nvim" },
  { "mfussenegger/nvim-lint" },

  -- Finder (fzf-lua is lightweight and fast)
  { "ibhagwan/fzf-lua" },
}

