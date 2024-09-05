return {
  {
    "nvim-telescope/telescope.nvim",
    cmd = "Telescope",
    init = function()
      local builtin = require "telescope.builtin"
      local wk = require "which-key"
      wk.add {
        mode = { "n", "v" },
        { "<leader>f", group = "file/find" },
        { "<leader>ff", builtin.find_files, desc = "Find File" },
        { "<leader>fb", builtin.buffers, desc = "Find Buffer" },
        { "<leader>fg", builtin.live_grep, desc = "Find with Grep" },
        { "<leader>fh", builtin.help_tags, desc = "Find Help" },
        { "<leader>fn", ":Telescope file_browser path=%:p:h select_buffer=true<CR>", desc = "File Browser" },
        { "<leader>t", group = "telescope" },
      }
    end,
    opts = function()
      return {
        defaults = {
          vimgrep_arguments = {
            "rg",
            "-L",
            "--color=never",
            "--no-heading",
            "--with-filename",
            "--line-number",
            "--column",
            "--smart-case",
            "--hidden",
          },
          previewer = true,
          file_previewer = require("telescope.previewers").vim_buffer_cat.new,
          grep_previewer = require("telescope.previewers").vim_buffer_vimgrep.new,
          qflist_previewer = require("telescope.previewers").vim_buffer_qflist.new,
        },
        extensions = {
          file_browser = {
            theme = "ivy",
            hijack_netrw = true,
          },
        },
        extensions_list = {
          "file_browser",
        },
      }
    end,
    config = function(_, opts)
      local telescope = require "telescope"
      telescope.setup(opts)

      -- load extensions
      for _, ext in ipairs(opts.extensions_list) do
        telescope.load_extension(ext)
      end
    end,
  },
  {
    "nvim-telescope/telescope-file-browser.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
  },
}
