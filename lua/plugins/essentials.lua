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

	--- Clipboard
	{
		"ojroques/nvim-osc52",
		config = function()
			require("osc52").setup({
				max_length = 0, -- no limit on copy length
				silent = false, -- print a message after copying
				trim = true, -- trim whitespace
				tmux_passthrough = true, -- allow OSC52 through tmux (see tmux config)
			})
			-- Key mappings (example: <leader>y to copy via OSC52)
			vim.keymap.set("n", "<leader>y", require("osc52").copy_operator, {
				expr = true,
				desc = "Copy text to system clipboard via OSC52",
			})
			vim.keymap.set("n", "<leader>Y", "<leader>y_", {
				remap = true,
				desc = "Copy current line to system clipboard via OSC52",
			})
			vim.keymap.set("v", "<leader>y", require("osc52").copy_visual, {
				desc = "Copy selection to system clipboard via OSC52",
			})
		end,
	},
	{
		"aserowy/tmux.nvim",

		config = function()
			return require("tmux").setup({
				copy_sync = {
					enable = false,
				},
			})
		end,
	},
}
