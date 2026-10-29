-- Treesitter
return {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
   branch = "main",
   lazy = false,
	config = function()
		local TS = require("nvim-treesitter")

		TS.setup({
			ensure_installed = {
				"c",
				"lua",
				"vim",
				"vimdoc",
            "python",
				"javascript",
				"typescript",
				"java",
				"css",
				"markdown",
				"markdown_inline",
			},
			sync_install = false,
			auto_install = true,
			highlight = { enable = true },
			indent = { enable = true },
		})

    vim.api.nvim_create_autocmd("FileType", {
      callback = function ()
        pcall(vim.treesitter.start)
      end
    })
	end,
}
