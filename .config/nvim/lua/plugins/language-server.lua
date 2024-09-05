return {
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      {
        "williamboman/mason.nvim",
        cmd = { "Mason", "MasonInstall", "MasonUpdate" },
        dependencies = {
          "mfussenegger/nvim-lint",
          "mhartington/formatter.nvim",
        },
      },
      {
        "williamboman/mason-lspconfig.nvim",
      },
      {
        "WhoIsSethDaniel/mason-tool-installer.nvim",
        cmd = {
          "MasonToolsInstall",
          "MasonToolsInstallSync",
          "MasonToolsUpdate",
          "MasonToolsUpdateSync",
          "MasonToolsClean",
        },
      },
    },
    config = function()
      require("nvchad.configs.lspconfig").defaults()

      local mason_config = require "plugins.configs.mason"

      require("mason").setup()
      require("mason-lspconfig").setup {
        automatic_installation = true,
      }

      require("mason-lspconfig").setup_handlers {
        -- The first entry (without a key) will be the default handler
        -- and will be called for each installed server that doesn't have
        -- a dedicated handler.
        function(server_name) -- default handler (optional)
          -- https://github.com/neovim/nvim-lspconfig/pull/3232
          -- https://github.com/neovim/nvim-lspconfig/pull/3232#issuecomment-2331025714
          if server_name == "tsserver" then
            server_name = "ts_ls"
          end

          require("lspconfig")[server_name].setup {
            on_attach = require("nvchad.configs.lspconfig").on_attach,
            on_init = require("nvchad.configs.lspconfig").on_init,
            capabilities = require("nvchad.configs.lspconfig").capabilities,
          }
        end,
      }

      require("mason-tool-installer").setup(mason_config)

      local formater_config = require "plugins.configs.formatter"
      require("formatter").setup(formater_config)

      local wk = require "which-key"
      wk.add {
        mode = { "n", "v" },
        { "<leader>cf", ":FormatWrite<CR>", desc = "Format file" },
      }
    end,
  },
}
