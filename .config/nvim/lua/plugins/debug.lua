return {
  "mfussenegger/nvim-dap",
  dependencies = {
    "rcarriga/nvim-dap-ui",
    "nvim-neotest/nvim-nio",
    "theHamsta/nvim-dap-virtual-text",
  },
  config = function()
    require("dapui").setup()
    local dap = require("dap")
    local ui = require("dapui")

    Set("n", "<leader>b", dap.toggle_breakpoint)
    Set("n", "<leader>gb", dap.run_to_cursor)

    -- Eval var under the cursor
    Set("n", "<leader>?", function()
      ui.eval(nil, { enter = true })
    end)

    Set("n", "<F1>", dap.continue)
    Set("n", "<F2>", dap.step_into)
    Set("n", "<F3>", dap.step_over)
    Set("n", "<F4>", dap.step_out)
    Set("n", "<F5>", dap.step_back)
    Set("n", "<F13>", dap.restart)

    dap.listeners.before.attach.dapui_config = function()
      ui.open()
    end
    dap.listeners.before.launch.dapui_config = function()
      ui.open()
    end
    dap.listeners.before.event_terminated.dapui_config = function()
      ui.close()
    end
    dap.listeners.before.event_exited.dapui_config = function()
      ui.close()
    end
  end,
}
