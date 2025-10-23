return {
	"folke/which-key.nvim",
	event = "VeryLazy",
	opts = {
		preset = "helix",
		spec = {
			{
				mode = { "n" },
				{ "K", desc = "Hovers over explanation" },
				{ "gd", desc = "Goes to definition" },
				{ "<C-a>", "ggVG", desc = "Selects entire buffer" },
			},
			{
				mode = { "n", "v" },
				{ "ca", desc = "Does a code action" },
				{ "<leader>w", ":w<cr>", desc = "Writes" },
				{ "<leader>q", ":q<cr>", desc = "Quits" },
			},
		},
	},
	keys = {
		{
			"<leader>?",
			function()
				require("which-key").show({ global = true })
			end,
			desc = "Buffer Global Keymaps (which-key)",
		},
	},
}
