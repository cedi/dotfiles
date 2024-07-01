return {
    {
      "folke/which-key.nvim",
      event = "VeryLazy",
      keys = { "<leader>", "<c-r>", "<c-w>", '"', "'", "`", "c", "v", "g" },
      init = function()
        vim.o.timeout = true
        vim.o.timeoutlen = 300
      end,
      opts = function()
        return require("plugins.configs.which-key")
      end,
      config = function(_, opts)
        local wk = require("which-key")
        wk.setup(opts)
        wk.register(opts.defaults)
      end,
    },
  }