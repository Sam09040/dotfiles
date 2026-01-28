return {
  "CRAG666/code_runner.nvim",
  dependencies = {
    { "CRAG666/betterTerm.nvim" },
  },
  config = function()
    local terminal = require("betterTerm")
    local runner = require("code_runner")

    terminal.setup({
      prefix = "Shell",
    })

    Set({ "n", "t" }, "<C-t>", terminal.open, { desc = "Open terminal" })
    Set({ "n", "t" }, "<C-q>", terminal.close, { desc = "Close terminal" })

    runner.setup({
      filetype = {
        c = "cd $dir && compile $fileName",
      },
    })

    Set("n", "<leader>rr", runner.run_code, { desc = "Runs code" })
  end,
}
