-- ale

vim.g.ale_linters = {
	-- cs = { "OmniSharp" }, -- Using roslyn.nvim instead
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
vim.g.ale_completion_enabled = 0 -- Using nvim-cmp for completion
