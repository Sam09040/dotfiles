-- File Tree
return {
	"nvim-neo-tree/neo-tree.nvim",
	lazy = false,
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-tree/nvim-web-devicons",
		"MunifTanjim/nui.nvim",
		"3rd/image.nvim",
	},
	keys = {
		{ "<leader>er", ":Neotree filesystem toggle<cr>", desc = "Toggles the Neotree" },
		{ "<leader>ef", ":Neotree focus<cr>", desc = "Focuses on the Neotree when open" },
	},
	-- @module 'neo-tree'
	-- @type neotree.Config
	opts = {
		enable_diagnostics = true,
		enable_git_status = true,
		open_files_using_relative_paths = false,
		sort_case_insensitive = false,
	},
	config = function()
		-- local set = vim.keymap.set
		-- -- Neo Tree
		-- set('n', '<leader>e', ':Neotree filesystem toggle<cr>')
	end,
}
