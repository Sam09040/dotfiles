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
				ensure_installed = { "lua_ls", "ts_ls", "clangd", "pyright", "codebook" },
				sync_install = false,
				automatic_enable = true,
			})
		end,
	},
	{
		"neovim/nvim-lspconfig",
		priority = 1000,
		config = function()
			set("n", "K", vim.lsp.buf.hover, {})
			set("n", "gd", vim.lsp.buf.definition, {})
			set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, {})
		end,
	},
}
