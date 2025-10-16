return {
  "MeanderingProgrammer/render-markdown.nvim",
  opts = {
    code = {
      enabled = true,
      sign = false,
      conceal_delimiters = false,
      language = true,
      position = "left",
      language_icon = true,
      language_name = true,
      language_info = true,
      width = "block",
      border = "thick",
      style = "full",
    },
    heading = {
      enabled = true,
      render_modes = false,
      sign = true,
      icons = {},
      position = "inline",
    },
    quote = { repeat_linebreak = true },
    win_options = {
      showbreak = {
        default = "",
        rendered = "  ",
      },
      breakindent = {
        default = false,
        rendered = true,
      },
      breakindentopt = {
        default = "",
        rendered = "",
      },
    },
  },
}
