return {
    {
        "lewis6991/gitsigns.nvim",
        opts = function()
            return require("plugins.configs.gitconfig")
          end,
        config = function(_, opts)
            local gitsigns = require('gitsigns')
            gitsigns.setup(opts)

            local wk = require('which-key')
            wk.add({
            mode = {"n", "v"},
            { "<leader>g", group = "git" },
            { "<leader>gb", group = "git blame" },
            { "<leader>gbl", function() gitsigns.blame_line{full=true} end, desc = "Git blame line" },
            { "<leader>gbt", gitsigns.toggle_current_line_blame, desc = "toggle current line blame" },
            { "<leader>gd", gitsigns.diffthis, desc = "Git diff" },
            })
        end,
    },
}