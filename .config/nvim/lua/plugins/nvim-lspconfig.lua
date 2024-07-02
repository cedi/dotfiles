return {
    "neovim/nvim-lspconfig",
    config = function()
      require("nvchad.configs.lspconfig").defaults()
      require "plugins.configs.lspconfig"
    end,
  }