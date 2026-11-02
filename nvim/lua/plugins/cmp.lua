local cmp = require('cmp')

cmp.setup({
	snippet = {
		expand = function(args)
			vim.snippet.expand(args.body)
		end,
	},
	mapping = cmp.mapping.preset.insert({
		['<C-Space>'] = cmp.mapping.complete(),
		['<C-e>'] = cmp.mapping.abort(),
		['<CR>'] = cmp.mapping.confirm({ select = false }),
		['<Tab>'] = cmp.mapping(function(fallback)
			if cmp.visible() then
				cmp.select_next_item()
			elseif vim.snippet.active({ direction = 1 }) then
				vim.snippet.jump(1)
			else
				fallback()
			end
		end, { 'i', 's' }),
		['<S-Tab>'] = cmp.mapping(function(fallback)
			if cmp.visible() then
				cmp.select_prev_item()
			elseif vim.snippet.active({ direction = -1 }) then
				vim.snippet.jump(-1)
			else
				fallback()
			end
		end, { 'i', 's' }),
	}),
	sources = cmp.config.sources({
		{ name = 'nvim_lsp' },
		{ name = 'path' },
	}, {
		{ name = 'buffer' },
	}),
})

-- Anuncia as capabilities do cmp para todos os servidores LSP
vim.lsp.config('*', {
	capabilities = require('cmp_nvim_lsp').default_capabilities(),
})
