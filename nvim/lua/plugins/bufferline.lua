-- Visualize tabs
return {
	"akinsho/bufferline.nvim",
	dependencies = "nvim-tree/nvim-web-devicons",
	lazy = false,
	keys = {
		{ "<leader>n", ":bn<cr>", desc = "Goes to the next buffer" },
		{ "<leader>p", ":bp<cr>", desc = "Goes to the previous buffer" },
		{ "<leader>x", ":bd<cr>", desc = "Deletes the current buffer" },
	},
	config = function()
		require("bufferline").setup({})
		-- -- buffer
		-- set('n', '<leader>n', ':bn<cr>')
		-- set('n', '<leader>p', ':bp<cr>')
		-- set('n', '<leader>x', ':bd<cr>')
	end,
}
