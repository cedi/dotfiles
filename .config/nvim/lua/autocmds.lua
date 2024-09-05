-- Create group to assign commands
-- "clear = true" must be set to prevent loading an
-- auto-command repeatedly every time a file is resourced
local auto_format = vim.api.nvim_create_augroup("Auto Formatters", { clear = true })

vim.api.nvim_create_autocmd({ "BufWritePost" }, {
    group = auto_format,
    callback = function()
      -- try_lint without arguments runs the linters defined in `linters_by_ft`
      -- for the current filetype
      --require("lint").try_lint()

      -- format
      vim.cmd(":silent FormatWrite")
    end,
  })
