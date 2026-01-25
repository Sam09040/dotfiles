return {
	"rachartier/tiny-inline-diagnostic.nvim",
	event = "VeryLazy",
	priority = 1000,
	config = function()
		require("tiny-inline-diagnostic").setup({
			preset = "amongus",
			options = {
				show_source = {
					enabled = true,
				},
				multilines = {
					enabled = true,
				},
				break_line = {
					enabled = false,
					after = 50,
				},
				show_all_diags_on_cursorline = false,
				throttle = 20,
				enable_on_insert = true,
				set_arrow_to_diag_color = true,
				softwrap = 50,
			},
		})
		vim.diagnostic.config({ virtual_text = false })
	end,
}
