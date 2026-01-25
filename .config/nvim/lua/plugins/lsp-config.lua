return {
	"neovim/nvim-lspconfig",
	priority = 1000,
	dependencies = {
		{
			"mason-org/mason.nvim",
			opts = {
				ui = {
					icons = {
						package_installed = "✓",
						package_pending = "➜",
						package_uninstalled = "✗",
					},
				},
			},
		},
		{
			"mason-org/mason-lspconfig.nvim",
			config = function()
				require("mason-lspconfig").setup({
					ensure_installed = { "lua_ls", "clangd", "pyright", "codebook" },
					sync_install = false,
					automatic_enable = true,
				})
			end,
		},
	},
	config = function()
		set("n", "K", vim.lsp.buf.hover, { desc = "Hover" })
		set("n", "gd", vim.lsp.buf.definition, { desc = "Goes to definition" })
		set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, { desc = "Shows code actions" })
		set("n", "gr", vim.lsp.buf.references, { desc = "Goes to references" })
		set({ "n", "v" }, "<leader>r", vim.lsp.buf.rename, { desc = "Rename" })
	end,
}
