return {
    config = {
      preset = "modern",
    },
    defaults = {
      {"g", group = "goto" },
      {"gs", group = "surround" },
      {"z", group = "fold" },
      {"]", group = "next" },
      {"[", group = "prev" },
      {"<leader><tab>", group = "tabs" },
      {"<leader>b", group = "buffer" },
      {"<leader>c", group = "code" },
      {"<leader>q", group = "quit/session" },
      {"<leader>s", group = "search" },
      {"<leader>u", group = "ui" },
      {"<leader>w", group = "windows" },
      {"<leader>x", group = "diagnostics/quickfix" },
      {"<leader>m", group = "marks" },
      {"<leader>d", group = "diagnostics" },
    },
}
