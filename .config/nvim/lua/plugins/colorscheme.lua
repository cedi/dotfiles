return {
  --  {
  --    "projekt0n/github-nvim-theme",
  --    name = "github_theme",
  --    priority = 1001,
  --    config = function()
  --      vim.cmd("colorscheme github_dark")
  --    end,
  --  },
  -- Dracula available but disabled (uncomment to switch)
  {
    "dracula/vim",
    name = "dracula",
    priority = 1002,
    config = function()
      vim.cmd("colorscheme dracula")
    end,
  },
}
