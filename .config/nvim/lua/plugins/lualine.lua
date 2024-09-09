function yamlSchema()
    local yaml_companion = require "yaml-companion"

    if yaml_companion.ctx.schema == nil then
        return ""
    end

    local schema = yaml_companion.get_buf_schema(0)

    if schema.result[1].name == "none" then
        return ""
    end

    return "  " .. schema.result[1].name .. " "
end

return {
  {
    "nvim-lualine/lualine.nvim",
    event = "VeryLazy",

    opts = function(_, opts)
      table.insert(opts.sections.lualine_x, yamlSchema)
      opts.options.theme = "auto"
    end,
  },
}