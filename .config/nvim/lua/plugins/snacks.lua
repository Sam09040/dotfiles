return {
  {
    "folke/snacks.nvim",
    priority = 1000,
    lazy = false,
    opts = {
      animate = { animate = true },
      bigfile = { enabled = true },
      indent = { enabled = true },
      input = { enabled = true },
      quickfile = { enabled = true },
      scope = { enabled = true },
      scroll = { enabled = true },
      terminal = { enabled = true },
      notifier = {
        enabled = true,
        timeout = 3000,
        style = "fancy",
        title = "Snacks",
      },
      styles = {
        notification = {
          wo = { wrap = true },
        },
      },
      keys = {
        {
          "<leader>un",
          function()
            Snacks.notifier.hide()
          end,
          desc = "Hide all notifications",
        },
        {
          "<c-/>",
          function()
            Snacks.terminal()
          end,
          desc = "Toggle terminal",
        },
        {
          "<leader>gb",
          function()
            Snacks.git_branches()
          end,
          desc = "Git Branches",
        },
        {
          "<leader>gg",
          function()
            Snacks.laygit()
          end,
          desc = "Lazygit",
        },
      },
    },
  },
  {
    "folke/noice.nvim",
    event = "VeryLazy",
    opts = {
      lsp = {
        override = {
          ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
          ["vim.lsp.util.stylize_markdown"] = true,
          ["cmp.entry.get_documentation"] = true,
        },
      },
      presets = {
        bottom_search = true,
        command_palette = true,
        long_message_to_split = true,
      },
    },
    dependencies = { "MunifTanjim/nui.nvim" },
  },
}
