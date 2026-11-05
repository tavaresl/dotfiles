-- Instala o vim-plug automaticamente se ainda não existir (máquina nova / WSL)
local plug_path = vim.fs.joinpath(vim.fn.stdpath('data'), 'site', 'autoload', 'plug.vim')
if not vim.uv.fs_stat(plug_path) then
	vim.fn.system({
		'curl', '-fLo', plug_path, '--create-dirs',
		'https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim',
	})
	if vim.v.shell_error ~= 0 then
		error('Falha ao baixar o vim-plug (curl instalado?)')
	end
	vim.cmd.source(plug_path)
end

local uname = vim.uv.os_uname()
local is_mac_arm = uname.sysname == 'Darwin' and uname.machine == 'arm64'

local Plug = vim.fn['plug#']

vim.call('plug#begin')

Plug('mason-org/mason.nvim')
Plug('tpope/vim-dispatch')
Plug('MunifTanjim/nui.nvim')
Plug('nvim-neo-tree/neo-tree.nvim')
Plug('neovim/nvim-lspconfig')
Plug('pmizio/typescript-tools.nvim')
Plug('nvim-tree/nvim-web-devicons')
Plug('lewis6991/gitsigns.nvim')
Plug('nvim-lualine/lualine.nvim')
Plug('hrsh7th/nvim-cmp')
Plug('hrsh7th/cmp-nvim-lsp')
Plug('hrsh7th/cmp-buffer')
Plug('hrsh7th/cmp-path')
Plug('jake-stewart/multicursor.nvim')
Plug('seblyng/roslyn.nvim')
Plug('folke/snacks.nvim')
Plug('nvim-treesitter/nvim-treesitter')
Plug('catppuccin/nvim', { ['as'] = 'catppuccin' })
Plug('mfussenegger/nvim-dap')
Plug('nvim-neotest/nvim-nio')
Plug('rcarriga/nvim-dap-ui')
Plug('ellisonleao/gruvbox.nvim')
Plug('nvim-lua/plenary.nvim')
Plug('stevearc/conform.nvim')

-- O netcoredbg oficial (Mason) só existe em x86_64 no macOS; este traz um build arm64 nativo
if is_mac_arm then
	Plug('Cliffback/netcoredbg-macOS-arm64.nvim')
end

vim.call('plug#end')

-- Instala os plugins que faltam antes do resto do init.lua fazer require deles
local missing = false
for _, spec in pairs(vim.g.plugs) do
	if not vim.uv.fs_stat(spec.dir) then
		missing = true
		break
	end
end
if missing then
	vim.cmd('PlugInstall --sync | close')
end
