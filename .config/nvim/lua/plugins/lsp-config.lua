return {
	{
		"mason-org/mason.nvim",
		lazy = false,
		config = function()
			require("mason").setup()
		end,
	},
	{
		"mason-org/mason-lspconfig.nvim",
		dependencies = {
			"neovim/nvim-lspconfig",
		},
		config = function()
			require("mason-lspconfig").setup({
				ensure_installed = { "lua_ls", "clangd", "pyright", "codebook" },
				sync_install = false,
				automatic_enable = true,
			})
		end,
	},
	{
		"neovim/nvim-lspconfig",
		priority = 1000,
		config = function()
			set("n", "K", vim.lsp.buf.hover)
			set("n", "gd", vim.lsp.buf.definition)
			set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action)
			set("n", "gr", vim.lsp.buf.references)
			set({ "n", "v" }, "<leader>r", vim.lsp.buf.rename)
		end,
	},
	{
		"rachartier/tiny-inline-diagnostic.nvim",
		event = "VeryLazy",
		priority = 1000,
		config = function()
			require("tiny-inline-diagnostic").setup({
				preset = "amongus",
				options = {
					show_source = {
						enabled = true,
					},
					multilines = {
						enabled = true,
					},
					break_line = {
						enabled = false,
						after = 50,
					},
					show_all_diags_on_cursorline = false,
					throttle = 20,
					enable_on_insert = true,
					set_arrow_to_diag_color = true,
					softwrap = 50,
				},
			})
			vim.diagnostic.config({ virtual_text = false })
		end,
	},
}
