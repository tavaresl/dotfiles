require('nvim-treesitter').setup({
	highlight = { enable = true },
	ensure_installed = {
		"c",
		"c_sharp",
		"razor",
		"cpp",
		"typescript",
		"typescriptreact",
		"javascript",
		"javascriptreact",
		"html",
		"css",
		"lua",
		"vim",
		"vimdoc",
		"query",
		"markdown",
		"markdown_inline"
	},
})
