return {
	{

		"catppuccin/nvim",
		name = "catppuccin",
		priority = 1000,
		config = function()
			vim.cmd.colorscheme("catppuccin")
			vim.opt.termguicolors = true
			require("catppuccin").setup({
				flavour = "mocha",
			})
		end,
	},
	{
		"norcalli/nvim-colorizer.lua",
		config = function()
			require("colorizer").setup({
				"*",
				css = { rgb_fn = true },
			})
		end,
	},
}
