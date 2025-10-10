return { -- nvim-lspconfig
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      {
        "mason-org/mason-lspconfig.nvim",
      },
      {
        "someone-stole-my-name/yaml-companion.nvim",
        opts = function()
          return require("plugins.configs.yaml-companion")
        end,
        config = function(_, opts)
          -- :Telescope yaml_schema
          require("telescope").load_extension("yaml_schema")
          require("yaml-companion").setup(opts)

          local wk = require("which-key")
          wk.add({
            mode = { "n", "v" },
            { "<leader>cy", ":Telescope yaml_schema<CR>", desc = "YAML Schema Browser" },
          })
        end,
      },
    },
    opts = {
      servers = {
        cssls = {},
        dotls = {},
        helm_ls = {},
        jqls = {},
        lua_ls = {},
        vimls = {},
        css_variables = {},
        html = {},
        nginx_language_server = {},
      },
      -- you can do any additional lsp server setup here
      -- return true if you don't want this server to be setup with lspconfig
      ---@type table<string, fun(server:string, opts:_.lspconfig.options):boolean?>
      setup = {
        -- example to setup with typescript.nvim
        tsserver = function(_, opts)
          require("typescript").setup({ server = opts })
          return true
        end,

        yamlls = function(_, opts)
          local cfg = require("yaml-companion").setup()
          require("lspconfig")["yamlls"].setup(cfg)
          return true
        end,
        -- Specify * to use this function as a fallback for any server
        -- ["*"] = function(server, opts) end,
      },
    },
  },

  require("plugins.configs.lsp.bash"),
}
