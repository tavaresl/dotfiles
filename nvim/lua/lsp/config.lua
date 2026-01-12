local lsp = require('lspconfig')

-- basic example; expand per server
lsp.lua_ls.setup({})
lsp.roslyn_ls = nil -- using seblyng/roslyn.nvim instead of default roslyn
lsp.ts_ls = nil -- using typescript-tools instead of tsserver (optional)

