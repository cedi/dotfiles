return {
  { import = "lazyvim.plugins.extras.dap.core" },
  { import = "lazyvim.plugins.extras.dap.nlua" },

  { import = "lazyvim.plugins.extras.formatting.prettier" },
  { import = "lazyvim.plugins.extras.linting.eslint" },

  { import = "lazyvim.plugins.extras.lang.ansible" },
  { import = "lazyvim.plugins.extras.lang.docker" },
  { import = "lazyvim.plugins.extras.lang.git" },
  { import = "lazyvim.plugins.extras.lang.go" },
  { import = "lazyvim.plugins.extras.lang.helm" },
  { import = "lazyvim.plugins.extras.lang.json" },
  { import = "lazyvim.plugins.extras.lang.markdown" },
  { import = "lazyvim.plugins.extras.lang.python" },
  { import = "lazyvim.plugins.extras.lang.terraform" },
  { import = "lazyvim.plugins.extras.lang.typescript" },
  { import = "lazyvim.plugins.extras.lang.toml" },
  { import = "lazyvim.plugins.extras.lang.yaml" },
  -- nvim-lspconfig
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      {
        "williamboman/mason-lspconfig.nvim",
      },
      {
        "someone-stole-my-name/yaml-companion.nvim",
        config = function()
          -- :Telescope yaml_schema
          require("telescope").load_extension "yaml_schema"

          local wk = require "which-key"
          wk.add {
            mode = { "n", "v" },
            { "<leader>cy", ":Telescope yaml_schema<CR>", desc = "YAML Schema Browser" },
          }
        end,
      },
    },
    opts = {
      servers = {
        bashls = {},
        bicep = {},
        codeqlls = {},
        -- csharp_ls = {},
        cssls = {},
        dotls = {},
        helm_ls = {},
        jqls = {},
        lua_ls = {},
        vimls = {},
        css_variables = {},
        html = {},
        nginx_language_server = {},
        -- powershell_es = {},
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
}