return {
  vim.lsp.config("clangd", {
    settings = {
      clangd = {
        InlayHints = {
          Enabled = true,
          ParameterNames = true,
          DeducedTypes = true,
          Designators = true,
        },
        fallbackFlags = { "-std=c++20" },
      },
    },
  }),
}
