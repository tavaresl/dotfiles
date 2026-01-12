require("config.options")
require("config.keymaps")
require("config.autocmds")

require("plugins.vim-plug")
require('plugins.mason')
require("plugins.catppuccin")
require("plugins.gruvbox")

vim.cmd.colorscheme("gruvbox")

-- lsp
require("lsp.config")
require("lsp.typescript")
require("lsp.roslyn")

-- per-plugin configs
require('plugins.ale')
require('plugins.coq')
require('plugins.lualine')
require('plugins.moveline')
require('plugins.multicursor')
require('plugins.neo-tree')
require('plugins.telescope')
require('plugins.nvim-treesitter')
require('plugins.dap')
require('plugins.dapui')
require('plugins.netcoredbg')
