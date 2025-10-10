return {
	{
		"nvim-telescope/telescope.nvim",
		dependencies = { "nvim-lua/plenary.nvim" },
		lazy = false,
		keys = {
			{ "<leader>fs", ":Telescope find_files<cr>", desc = "Seaches through cwd's files" },
			{ "<leader>fp", ":Telescope git_files<cr>", desc = "Searches through git files" },
			{ "<leader>fz", ":Telescope live_grep<cr>", desc = "Searches though files' content" },
			{ "<leader>fo", ":Telescope oldfiles<cr>", desc = "Searches through old files" },
		},
		config = function()
			-- local builtin = require("telescope.builtin")
			-- local set = vim.keymap.set
			-- -- Telescope
			-- set('n', '<leader>fs', builtin.find_files, {})
			-- set('n', '<leader>fp', builtin.git_files, {})
			-- set('n', '<leader>fz', builtin.live_grep, {})
			-- set('n', '<leader>fo', builtin.oldfiles, {})
		end,
	},
	{
		"nvim-telescope/telescope-ui-select.nvim",
		config = function()
			require("telescope").setup({
				extensions = {
					["ui-select"] = {
						require("telescope.themes").get_dropdown({}),
					},
				},
			})
			require("telescope").load_extension("ui-select")
		end,
	},
}
