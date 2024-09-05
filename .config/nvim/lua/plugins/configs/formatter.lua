return {
  logging = true,
  log_level = vim.log.levels.WARN,
  filetype = {
    lua = { require("formatter.filetypes.lua").stylua },
    c = { require "formatter.filetypes.c" },
    cmake = { require "formatter.filetypes.cmake" },
    cpp = { require "formatter.filetypes.cpp" },
    cs = { require("formatter.filetypes.cs").dotnetformat },
    go = {
      require("formatter.filetypes.go").gofmt,
      require("formatter.filetypes.go").gofumpt,
    },
    python = { require("formatter.filetypes.python").autopep8 },
    typescript = { require("formatter.filetypes.typescript").prettier },
    yaml = { require("formatter.filetypes.yaml").prettier },
  },
}
