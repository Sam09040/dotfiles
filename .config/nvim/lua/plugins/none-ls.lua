return {
	"nvimtools/none-ls.nvim",
	lazy = false,
	debug = true,
	keys = {
		{
			"<leader>gf",
			function()
				vim.lsp.buf.format({ timeout_ms = 2000 })
			end,
			desc = "Format buffer",
		},
	},
	config = function()
		local null_ls = require("null-ls")
		local formatting = null_ls.builtins.formatting
		-- local diagnostics = null_ls.builtins.diagnostics
		null_ls.setup({
			sources = {
				-- Lua
				formatting.stylua,
				-- Python
				formatting.black,
				-- C, C++
				formatting.clang_format,
				-- Js, Ts
				formatting.prettier,
			},
		})
	end,
}
