return {
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      {
        "williamboman/mason.nvim",
        cmd = { "Mason", "MasonInstall", "MasonUpdate" },
        dependencies = {
          "mfussenegger/nvim-lint",
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
      {
        "someone-stole-my-name/yaml-companion.nvim",
        config = function()
          -- :Telescope yaml_schema
          require("telescope").load_extension("yaml_schema")

          local wk = require("which-key")
          wk.add {
            mode = { "n", "v" },
            { "<leader>ty", ":Telescope yaml_schema<CR>", desc = "YAML Schema Browser" },
          }
        end,
      }
    },
    config = function()
      require("nvchad.configs.lspconfig").defaults()

      local mason_config = require "plugins.configs.mason"
      local yaml_companion_cfg = require "plugins.configs.yaml-companion"

      require("mason").setup()
      require("mason-lspconfig").setup {
        automatic_installation = true,
      }

      local yaml_companion = require("yaml-companion").setup(yaml_companion_cfg)

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

          local lsp = require("lspconfig")[server_name]

          local function merge(t1, t2)
            for k, v in pairs(t2) do
                t1[k] = v
            end
            return t1
          end

          local lsp_config = {
            on_attach = require("nvchad.configs.lspconfig").on_attach,
            on_init = require("nvchad.configs.lspconfig").on_init,
            capabilities = require("nvchad.configs.lspconfig").capabilities,
          }

          if server_name == "yamlls" then
            lsp_config = merge(lsp_config, yaml_companion)
          end

          lsp.setup(lsp_config)
        end,
      }

      require("mason-tool-installer").setup(mason_config)
    end,
  },
}
