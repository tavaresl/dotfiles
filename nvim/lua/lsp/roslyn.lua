local roslyn = require('roslyn')

roslyn.setup({
	config = {
		-- O Roslyn derruba o processo (Contract.Fail em CompletionResolveHandler)
		-- quando recebe completionItem/resolve de um item fora do cache.
		-- Desativar o resolve evita o crash ao navegar com <Tab> no completion.
		on_init = function(client)
			local completion = client.server_capabilities.completionProvider
			if completion then
				completion.resolveProvider = false
			end
		end,
	},
})
