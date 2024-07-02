return {
	{
		"cappyzawa/trim.nvim",
        lazy = false,
		opts = {
            ft_blocklist = {
                "TelescopePrompt"
            },

			-- replace multiple blank lines with a single line
            patterns = {
                [[%s/\(\n\n\)\n\+/\1/]],
            },

            trim_on_write = true,
            trim_trailing = true,
            trim_last_line = false,
            trim_first_line = true,
            highlight = false,
		},
	},
}
