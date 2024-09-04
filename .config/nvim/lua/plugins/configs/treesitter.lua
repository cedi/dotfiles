return {
	ensure_installed = {
        "vim", "lua", "vimdoc", "c", "cpp",
        "go", "dockerfile", "diff", "cmake",
        "awk", "bash", "csv", "git_config",
        "git_rebase", "gitattributes", "gitcommit",
        "gitignore", "gomod", "gosum", "gowork",
        "html", "jq", "json", "json5", "jsonc",
        "markdown", "passwd", "python", "regex",
        "terraform", "tmux", "toml", "csv", "tsv",
        "typescript", "javascript", "xml", "yaml"
    },
	highlight = {
		enable = true,
		use_languagetree = true,
	},
	indent = { enable = true },
	autotag = {
		enable = true,
		enable_rename = true,
		enable_close = true,
		enable_close_on_slash = true,
		filetypes = { "html", "xml" },
	},
}