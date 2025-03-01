return {
  {
    "mfussenegger/nvim-dap",
    dependencies = {
      "nvim-neotest/nvim-nio",
      "rcarriga/nvim-dap-ui",
      "mfussenegger/nvim-dap-python",
      "theHamsta/nvim-dap-virtual-text",
    },
    config = function()
      local dap = require("dap")
      local dapui = require("dapui")
      local dap_python = require("dap-python")

      require("dapui").setup({})
      require("nvim-dap-virtual-text").setup({
        commented = true, -- Show virtual text alongside comment
      })

      local resolve_python_path = function()
        local conda_prefix = os.getenv("CONDA_PREFIX")
        if conda_prefix then
          return conda_prefix .. "/bin/python"
        else
          return "python3"
        end
      end

      local python_path = resolve_python_path()

      dap_python.setup(python_path)
      dap_python.resolve_python = resolve_python_path
      dap_python.test_runner = "pytest"
      vim.fn.sign_define("DapBreakpoint", {

        text = "",
        texthl = "DiagnosticSignError",
        linehl = "",
        numhl = "",
      })

      vim.fn.sign_define("DapBreakpointRejected", {
        text = "", -- or "❌"
        texthl = "DiagnosticSignError",
        linehl = "",
        numhl = "",
      })

      vim.fn.sign_define("DapStopped", {
        text = "", -- or "→"
        texthl = "DiagnosticSignWarn",
        linehl = "Visual",
        numhl = "DiagnosticSignWarn",
      })

      -- Automatically open/close DAP UI
      dap.listeners.after.event_initialized["dapui_config"] = function()
        dapui.open()
      end

      vim.keymap.set("n", "<leader>dT", function()
        require("dap-python").test_class()
      end, { noremap = true, silent = true, desc = "Debug Pytest class" })

      vim.keymap.set("n", "<leader>dt", function()
        require("dap-python").test_method()
      end, { noremap = true, silent = true, desc = "Debug Pytest function" })

      local opts = { noremap = true, silent = true }

      -- Toggle breakpoint
      vim.keymap.set("n", "<leader>db", function()
        dap.toggle_breakpoint()
      end, opts)

      -- Continue / Start
      vim.keymap.set("n", "<leader>dc", function()
        dap.continue()
      end, opts)

      -- Step Over
      vim.keymap.set("n", "<leader>do", function()
        dap.step_over()
      end, opts)

      -- Step Into
      vim.keymap.set("n", "<leader>di", function()
        dap.step_into()
      end, opts)

      -- Step Out
      vim.keymap.set("n", "<leader>dO", function()
        dap.step_out()
      end, opts)

      -- Keymap to terminate debugging
      vim.keymap.set("n", "<leader>dq", function()
        require("dap").terminate()
      end, opts)

      -- Toggle DAP UI
      vim.keymap.set("n", "<leader>du", function()
        dapui.toggle()
      end, opts)

      vim.keymap.set("n", "<leader>dd", function()
        print("Detected Python path: " .. resolve_python_path())
      end, opts)
    end,
  },
}
