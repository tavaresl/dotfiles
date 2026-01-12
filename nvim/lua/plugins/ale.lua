-- ale

vim.g.ale_linters = {
	cs = { "OmniSharp" },
	javascript = { "prettier", "eslint" },
	javascriptreact = { "prettier", "eslint" },
	typescript = { "prettier", "eslint" },
	typescriptreact = { "prettier", "eslint" },
}

vim.g.ale_fixers = {
	javascript = { "prettier" },
	javascriptreact = { "prettier" },
	typescript = { "prettier" },
	typescriptreact = { "prettier" },
}

vim.g.ale_fix_on_save = 1
