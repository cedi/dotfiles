function openFileInCode()
  local fileName = vim.api.nvim_buf_get_name(0)
  vim.cmd(":silent !code " .. fileName)
end

function openFolderInCode()
  vim.cmd ":silent !code ."
end

return {
  config = {
    preset = "modern",
  },
  defaults = {
    { "g", group = "goto" },
    { "gs", group = "surround" },
    { "z", group = "fold" },
    { "]", group = "next" },
    { "[", group = "prev" },
    { "<leader><tab>", group = "tabs" },
    { "<leader>b", group = "buffer" },
    { "<leader>c", group = "code" },
    { "<leader>q", group = "quit/session" },
    { "<leader>s", group = "search" },
    { "<leader>u", group = "ui" },
    { "<leader>w", group = "windows" },
    { "<leader>x", group = "diagnostics/quickfix" },
    { "<leader>m", group = "marks" },
    { "<leader>d", group = "diagnostics" },
    { "<leader>v", group = "VSCode" },
    { "<leader>vc", openFolderInCode, desc = "Open the current folder in vsc" },
    { "<leader>vf", openFileInCode, desc = "Open the current file in vsc" },
  },
}
