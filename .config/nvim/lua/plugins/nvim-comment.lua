return {
	"terrortylor/nvim-comment",
	lazy = false,
	keys = {
		{ "<leader>/", desc = "Toggles comment on the selected lines" },
	},
	config = function()
		require("nvim_comment").setup()
		Set({ "n", "v" }, "<leader>/", ":CommentToggle<cr>")
	end,
}
