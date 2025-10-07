return {
	"terrortylor/nvim-comment",
	config = function()
		require("nvim_comment").setup()
		set({ "n", "v" }, "<leader>/", ":CommentToggle<cr>")
	end,
}
