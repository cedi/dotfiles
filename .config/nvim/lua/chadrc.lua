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
    order = { "mode", "file", "git", "%=", "lsp_msg", "%=", "diagnostics", "lsp", "yamlschema","cwd", "cursor" },
    modules = {
      yamlschema = function()
        local yaml_companion = require("yaml-companion")

        if yaml_companion.ctx.schema == nil then
          return ""
        end

        local schema = yaml_companion.get_buf_schema(0)

        if schema.result[1].name == "none" then
          return ""
        end

        return " ( " .. schema.result[1].name .. ") "
      end,
    }
  },

  telescope = { style = "bordered" }, -- borderless / bordered

  nvdash = {
    load_on_startup = true,
  },

  cheatsheet = {
    theme = "grid", -- simple/grid
    excluded_groups = {}, -- can add group name or with mode
  },
}

return M
