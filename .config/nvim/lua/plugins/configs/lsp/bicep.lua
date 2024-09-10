return {
  {
    "nvim-treesitter/nvim-treesitter",
    opts = { ensure_installed = { "bicep" } },
  },
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        bicep = {}
      },
    },
  },
}