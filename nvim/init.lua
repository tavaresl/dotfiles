require("config.options")
require("config.keymaps")
require("config.autocmds")

require("plugins.vim-plug")
require('plugins.mason')
require("plugins.catppuccin")
require("plugins.gruvbox")
require("plugins.snacks")

vim.cmd.colorscheme("gruvbox")

-- lsp
require("lsp.config")
require("lsp.gopls")
require("lsp.typescript")
require("lsp.roslyn")
require("lsp.ruby-lsp")

-- per-plugin configs
require('plugins.coq')
require('plugins.lualine')
require('plugins.neo-tree')
require('plugins.nvim-treesitter')
require('plugins.dap')
require('plugins.dapui')
require('plugins.netcoredbg')
