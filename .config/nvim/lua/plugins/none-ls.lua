return {
	"nvimtools/none-ls.nvim",
	lazy = false,
	keys = {
		{ "<leader>gf", vim.lsp.buf.format, desc = "Formats the file based on the LSP." },
	},
	config = function()
		local null_ls = require("null-ls")
		local formatting = null_ls.builtins.formatting
		-- local diagnostics = null_ls.builtins.diagnostics
		vim.lsp.buf.format({ timeout_ms = 2000 })
		null_ls.setup({
			sources = {
				-- Lua
				formatting.stylua,
				-- Python
				formatting.black,
				formatting.isort,
				-- C, C++
				formatting.clang_format,
				-- Js, Ts
				formatting.prettier,
			},
		})

		-- set("n", "<leader>gf", vim.lsp.buf.format, {})
	end,
}
