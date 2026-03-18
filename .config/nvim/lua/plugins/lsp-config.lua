return {
  "neovim/nvim-lspconfig",
  priority = 1000,
  dependencies = {
    {
      "mason-org/mason.nvim",
      opts = {
        ui = {
          icons = {
            package_installed = "✓",
            package_pending = "➜",
            package_uninstalled = "✗",
          },
        },
      },
    },
    {
      "mason-org/mason-lspconfig.nvim",
      config = function()
        require("mason-lspconfig").setup({
          ensure_installed = { "lua_ls", "clangd", "pyright", "codebook" },
          sync_install = false,
          automatic_enable = true,
        })
      end,
    },
  },
  config = function()
    Set("n", "K", vim.lsp.buf.hover, { desc = "Hover" })
    Set("n", "gd", ":Telescope lsp_definitions<cr>", { desc = "Shows definition", silent = true, expr = true })
    Set("n", "gR", ":Telescope lsp_references<cr>", { desc = "Shows references", silent = true, expr = true })
    Set("n", "gD", ":Telescope diagnostics<cr>", { desc = "Shows diagnostics", silent = true, expr = true })
    Set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, { desc = "Shows code actions" })
    Set({ "n", "v" }, "<leader>gr", vim.lsp.buf.rename, { desc = "Rename" })

    vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())
  end,
}
