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

	--- ToggleTerm
	{
		"akinsho/toggleterm.nvim",
		config = true,
		cmd = "ToggleTerm",
		keys = {
			{ "§", "<cmd>ToggleTerm<cr>", desc = "Toggle floating terminal on MacOS" },
			{ "<F2>", "<cmd>ToggleTerm<cr>", desc = "Toggle floating terminal on Windows" },
		},
		opts = {
			open_mapping = { [[§]], [[<F2>]] },
			direction = "float",
			shade_filetypes = {},
			hide_numbers = true,
			insert_mappings = true,
			terminal_mappings = true,
			start_in_insert = true,
			close_on_exit = true,
		},
	},

	--- NeoGit
	{
		"NeogitOrg/neogit",
		dependencies = {
			"nvim-lua/plenary.nvim", -- required
			"sindrets/diffview.nvim", -- optional - Diff integration
			"ibhagwan/fzf-lua", -- optional
		},
		config = true,
	},
}
