-- lua/plugins/dap-override.lua
return {
  "mfussenegger/nvim-dap",
  -- This keys table will OVERWRITE the default keys provided by lazyvim
  keys = {
    { "<leader>d", group = "[D]ebug", desc = "Debug Menu" },
    {
      "<F5>",
      function()
        require("dap").continue()
      end,
      desc = "Continue (F5)",
    },
    {
      "<leader>dd",
      function()
        require("dap").continue()
      end,
      desc = "Continue (F5)",
    },
    {
      "<leader>dq",
      function()
        require("dap").terminate()
      end,
      desc = "Quit/Terminate",
    },
    {
      "<F9>",
      function()
        require("dap").toggle_breakpoint()
      end,
      desc = "Toggle Breakpoint (F9)",
    },
    {
      "<leader>db",
      function()
        require("dap").toggle_breakpoint()
      end,
      desc = "Toggle Breakpoint (F9)",
    },
    {
      "<F10>",
      function()
        require("dap").step_over()
      end,
      desc = "Step Over (F10)",
    },
    {
      "<leader>do",
      function()
        require("dap").step_over()
      end,
      desc = "Step Over (F10)",
    },
    {
      "<F11>",
      function()
        require("dap").step_into()
      end,
      desc = "Step Into (F11)",
    },
    {
      "<leader>di",
      function()
        require("dap").step_into()
      end,
      desc = "Step Into (F11)",
    },
    {
      "<leader>du",
      function()
        require("dap").step_out()
      end,
      desc = "Step Out",
    },
    {
      "<leader>dr",
      function()
        require("dapui").toggle()
      end,
      desc = "Toggle Debug UI",
    },
    {
      "<leader>de",
      function()
        require("dapui").eval()
      end,
      desc = "Eval Expression",
      mode = { "n", "v" },
    },
    {
      "<leader>dB",
      function()
        local widgets = require("dap.ui.widgets")
        local sidebar = widgets.sidebar(widgets.breakpoints)
        sidebar.open()
      end,
      desc = "View Breakpoints",
    },
  },
}
