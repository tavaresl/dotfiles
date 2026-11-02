require("conform").setup({
	formatters_by_ft = {
		cs = { "csharpier" }, 
	},

	format_on_save = {
		timeout_ms = 500,
		lsp_format = "fallback",
	},
})

