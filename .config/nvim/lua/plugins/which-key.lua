return {
  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    keys = { "<leader>", "<c-r>", "<c-w>", '"', "'", "`", "c", "v", "g" },
    dependencies = { 
      "nvim-tree/nvim-web-devicons",
      "echasnovski/mini.icons",
    },
    opts = function()
      return require("plugins.configs.which-key")
    end,
    config = function(_, opts)
      local wk = require("which-key")
      wk.setup(opts.config)
      wk.add(opts.defaults)
    end,
  },
}