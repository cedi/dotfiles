function conformFormat()
  require("conform").format { async = true }
end

return {
  "stevearc/conform.nvim",
  event = "BufWritePre",
  cmd = { "ConformInfo" },
  config = function()
    local conform_config = require "plugins.configs.conform"
    local conform = require "conform"

    conform.setup(conform_config)

    local wk = require "which-key"
    wk.add {
      mode = { "n", "v" },
      { "<leader>cf", conformFormat, desc = "Format file" },
    }
  end,
}

