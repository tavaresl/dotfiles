-- nvim-treesitter (branch main): setup() só aceita install_dir.
-- Parsers são instalados com install() e o highlight é ligado por FileType.
local parsers = {
	"c",
	"c_sharp",
	"razor",
	"cpp",
	"typescript",
	"tsx",
	"javascript",
	"html",
	"css",
	"lua",
	"vim",
	"vimdoc",
	"query",
	"markdown",
	"markdown_inline",
}

if vim.fn.executable('tree-sitter') == 1 then
	-- Assíncrono; parsers já instalados são ignorados
	require('nvim-treesitter').install(parsers)
else
	vim.schedule(function()
		vim.notify('tree-sitter CLI não encontrado: parsers não serão instalados', vim.log.levels.WARN)
	end)
end

vim.api.nvim_create_autocmd('FileType', {
	group = vim.api.nvim_create_augroup('treesitter_start', { clear = true }),
	callback = function(args)
		-- Falha silenciosamente se não houver parser para o filetype
		pcall(vim.treesitter.start, args.buf)
	end,
})
