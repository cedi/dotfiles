return {
  formatters_by_ft = {
    lua = { "stylua" },
    css = { "prettier" },
    html = { "prettier" },
    python = { "autopep8" },
    typescript = { "prettier" },
    go = {
      "gofumpt",
      "goimports",
      "golines",
    },
    yaml = { "yamlfmt" },
    markdown = {
      "markdown-toc",
      "markdownlint",
    },
    cs = { "csharpier" },
    sql = { "sqlfmt" },
  },

  format_on_save = {
    -- These options will be passed to conform.format()
    timeout_ms = 500,
    lsp_fallback = true,
  },
}
