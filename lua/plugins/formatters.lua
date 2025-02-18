return {
  "stevearc/conform.nvim",
  opts = {
    formatters_by_ft = {
      html = { "prettier" },
      python = { "isort", "black" },
      htmldjango = { "djlint" },
      javascript = { { "priettier", "prettierd" } },
    },
    format_on_save = {
      timeout_ms = 500,
      lsp_fallback = true,
    },
  },
}
