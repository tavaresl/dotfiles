-- local lsp = require('lspconfig')

-- basic example; expand per server
vim.lsp.config('lua_ls', {})
vim.lsp.enable("ruby-lsp")
vim.lsp.enable('roslyn', nil)
vim.lsp.enable('gopls', nil)
