require("snacks").setup({
  bigfile = { enabled = true },
  dashboard = { enabled = false }, -- Disabled to fix 'lazy.stats' error with vim-plug
  indent = { enabled = true },
  input = { enabled = true },
  notifier = { enabled = true },
  quickfix = { enabled = true },
  scroll = { enabled = true },
  statuscolumn = { enabled = true },
  words = { enabled = true },
  picker = { enabled = true },
  explorer = { enabled = true },
  zen = { enabled = true },
})
