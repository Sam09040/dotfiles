return {
  {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
    config = function()
      vim.cmd.colorscheme("catppuccin-nvim")
      vim.opt.termguicolors = true
      vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
      require("catppuccin").setup({
        flavour = "mocha",
        transparent_background = true,
        float = {
          transparent = true,
          solid = true,
        },
        styles = {
          comments = { "italic" },
          functions = { "italic" },
        },
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
