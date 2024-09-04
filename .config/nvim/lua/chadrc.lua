-- This file needs to have same structure as nvconfig.lua 
-- https://github.com/NvChad/ui/blob/v2.5/lua/nvconfig.lua

---@type ChadrcConfig
local M = {}

M.ui = {
	theme = "github_dark",
  transparency = false,

  statusline = {
    theme = "default",
    separator_style = "arrow",
  },

  telescope = { style = "bordered" }, -- borderless / bordered

  nvdash = {
    load_on_startup = true,
  },

  cheatsheet = {
    theme = "grid", -- simple/grid
    excluded_groups = { }, -- can add group name or with mode
  },
}

return M
