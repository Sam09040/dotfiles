return {
   "linux-cultist/venv-selector.nvim",
   dependencies = {
      "neovim/nvim-lspconfig",
      { "nvim-telescope/telescope.nvim" },
   },
   ft = "python",
   keys = {
      { "vs", ":VenvSelect<cr>" },
   },
   opts = {},
}
