return {
	"folke/which-key.nvim",
	event = "VeryLazy",
	opts = {
		preset = "helix",
		spec = {
			{ "K", desc = "Hovers over explanation" },
			{ "gd", desc = "Goes to definition" },
			{ "ca", desc = "Does a code action, if possible" },
			{
				mode = { "n", "v" },
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
