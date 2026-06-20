-- local lsp = require('lspconfig')

-- basic example; expand per server
vim.lsp.config('lua_ls', {})
vim.lsp.enable("ruby-lsp")
vim.lsp.config('roslyn_ls', nil)
vim.lsp.config('ts_ls', nil)
