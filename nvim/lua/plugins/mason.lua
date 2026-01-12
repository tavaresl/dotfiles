require('mason').setup {
	registries = {
        "github:mason-org/mason-registry",
        "github:Crashdummyy/mason-registry",
    },
	ensure_installed = {
		"lua-language-server",
		"csharp-language-server",
        "xmlformatter",
		"clangd",
        "stylua",
        "bicep-lsp",
        "html-lsp",
        "css-lsp",
        "prettier",
        "json-lsp"
	}
}

