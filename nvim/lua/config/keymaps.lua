local function tab(str)
	return vim.api.nvim_replace_termcodes(str, true, true, true)
end

local map = vim.keymap.set

-- Standard Tab for completion
map("i", "<Tab>", function()
	if vim.fn.pumvisible() ~= 0 then
		return tab("<C-n>")
	end
	return tab("<Tab>")
end, { expr = true, silent = true, desc = "Next completion or Tab" })

map("n", "<leader>pv", "<cmd>Ex<cr>", { silent = true })

-- Neotree remaps
map("n", "<leader>ts", "<cmd>Neotree toggle right<cr>",         { silent = true }) -- Toggle filetree on right side
map("n", "<leader>tb", "<cmd>Neotree toggle buffers right<cr>", { silent = true }) -- Toggle open buffers - buffers on right side


-- LSP actions
map("n",        "<F2>", "<cmd>lua vim.lsp.buf.rename()<cr>",      { silent = true, desc = "[r]ename [s]ymbol" }) -- (R)ename (W)ord [symbol]
map({"n", "x"}, "<leader>ca", "<cmd>lua vim.lsp.buf.code_action()<cr>", { silent = true, desc = "[c]ode [a]ctions" }) -- Open diagnostics for whats below cursor
map({"n", "x"}, "gh", "<cmd>lua vim.lsp.buf.hover({ border = 'rounded' })<cr>",       { silent = true, desc = "[h]over [s]ymbol" }) -- (H)over (W)ord [symbol]

-- Snacks
map({"n", "x"}, "gd", function() Snacks.picker.lsp_definitions() end,       { silent = true, desc = "[g]oto [d]efinition"   })
map({"n", "x"}, "gD", function() Snacks.picker.lsp_declarations() end,      { silent = true, desc = "[g]oto [D]eclarations" })
map({"n", "x"}, "gr", function() Snacks.picker.lsp_references() end,        { nowait = true, desc = "References" })
map({"n", "x"}, "gI", function() Snacks.picker.lsp_implementations() end,   { desc = "Go{to Implementation" })
map({"n", "x"}, "gy", function() Snacks.picker.lsp_type_definitions() end,  { desc = "Goto T[y]pe Definition)" })
map({"n", "x"}, "gs", function() Snacks.picker.lsp_symbols() end,           { desc = "LSP Symbols" })
map({"n", "x"}, "gS", function() Snacks.picker.lsp_workspace_symbols() end, { desc = "LSP Workspace Symbols" })

-- Find
map({"n", "x"}, "<leader><space>", function() Snacks.picker.smart() end,                                   { desc = "Smart Find Files" })
map({"n", "x"}, "<leader>,",       function() Snacks.picker.buffers() end,                                 { desc = "Buffers" })
map({"n", "x"}, "<leader>/",       function() Snacks.picker.grep() end,                                    { desc = "Grep" })
map({"n", "x"}, "<leader>:",       function() Snacks.picker.command_history() end,                         { desc = "Command History" })
map({"n", "x"}, "<leader>n",       function() Snacks.picker.notifications() end,                           { desc = "Notification History" })
map({"n", "x"}, "<leader>e",       function() Snacks.explorer() end,                                       { desc = "File Explorer" })
map({"n", "x"}, "<leader>fb",      function() Snacks.picker.buffers() end,                                 { desc = "Buffers" })
map({"n", "x"}, "<leader>fc",      function() Snacks.picker.files({ cwd = vim.fn.stdpath("config") }) end, { desc = "Find Config File" })
map({"n", "x"}, "<leader>ff",      function() Snacks.picker.files() end,                                   { desc = "Find Files" })
map({"n", "x"}, "<leader>fg",      function() Snacks.picker.git_files() end,                               { desc = "Find Git Files" })
map({"n", "x"}, "<leader>fp",      function() Snacks.picker.projects() end,                                { desc = "Projects" })
map({"n", "x"}, "<leader>fr",      function() Snacks.picker.recent() end,                                  { desc = "Recent" })

-- Git
map({"n", "x"}, "<leader>gb", function() Snacks.picker.git_branches() end, { desc = "Git Branches" })
map({"n", "x"}, "<leader>gl", function() Snacks.picker.git_log() end,      { desc = "Git Log" })
map({"n", "x"}, "<leader>gL", function() Snacks.picker.git_log_line() end, { desc = "Git Log Line" })
map({"n", "x"}, "<leader>gs", function() Snacks.picker.git_status() end,   { desc = "Git Status" })
map({"n", "x"}, "<leader>gS", function() Snacks.picker.git_stash() end,    { desc = "Git Stash" })
map({"n", "x"}, "<leader>gd", function() Snacks.picker.git_diff() end,     { desc = "Git Diff (Hunks)" })
map({"n", "x"}, "<leader>gf", function() Snacks.picker.git_log_file() end, { desc = "Git Log File" })

-- Grep
map({"n", "x"}, "<leader>sb", function() Snacks.picker.lines() end,        { desc = "Buffer Lines" })
map({"n", "x"}, "<leader>sB", function() Snacks.picker.grep_buffers() end, { desc = "Grep Open Buffers" })
map({"n", "x"}, "<leader>sg", function() Snacks.picker.grep() end,         { desc = "Grep" })
map({"n", "x"}, "<leader>sw", function() Snacks.picker.grep_word() end,    { desc = "Visual selection or word" })

-- Search
map({"n", "x"}, '<leader>s"', function() Snacks.picker.registers() end,          { desc = "Registers" })
map({"n", "x"}, '<leader>s/', function() Snacks.picker.search_history() end,     { desc = "Search History" })
map({"n", "x"}, "<leader>sa", function() Snacks.picker.autocmds() end,           { desc = "Autocmds" })
map({"n", "x"}, "<leader>sb", function() Snacks.picker.lines() end,              { desc = "Buffer Lines" })
map({"n", "x"}, "<leader>sc", function() Snacks.picker.command_history() end,    { desc = "Command History" })
map({"n", "x"}, "<leader>sC", function() Snacks.picker.commands() end,           { desc = "Commands" })
map({"n", "x"}, "<leader>sd", function() Snacks.picker.diagnostics() end,        { desc = "Diagnostics" })
map({"n", "x"}, "<leader>sD", function() Snacks.picker.diagnostics_buffer() end, { desc = "Buffer Diagnostics" })
map({"n", "x"}, "<leader>sh", function() Snacks.picker.help() end,               { desc = "Help Pages" })
map({"n", "x"}, "<leader>sH", function() Snacks.picker.highlights() end,         { desc = "Highlights" })
map({"n", "x"}, "<leader>si", function() Snacks.picker.icons() end,              { desc = "Icons" })
map({"n", "x"}, "<leader>sj", function() Snacks.picker.jumps() end,              { desc = "Jumps" })
map({"n", "x"}, "<leader>sk", function() Snacks.picker.keymaps() end,            { desc = "Keymaps" })
map({"n", "x"}, "<leader>sl", function() Snacks.picker.loclist() end,            { desc = "Location List" })
map({"n", "x"}, "<leader>sm", function() Snacks.picker.marks() end,              { desc = "Marks" })
map({"n", "x"}, "<leader>sM", function() Snacks.picker.man() end,                { desc = "Man Pages" })
map({"n", "x"}, "<leader>sp", function() Snacks.picker.lazy() end,               { desc = "Search for Plugin Spec" })
map({"n", "x"}, "<leader>sq", function() Snacks.picker.qflist() end,             { desc = "Quickfix List" })
map({"n", "x"}, "<leader>sR", function() Snacks.picker.resume() end,             { desc = "Resume" })
map({"n", "x"}, "<leader>su", function() Snacks.picker.undo() end,               { desc = "Undo History" })
map({"n", "x"}, "<leader>uC", function() Snacks.picker.colorschemes() end,       { desc = "Colorschemes" })

-- Others
map({"n", "x"}, "<leader>z",  function() Snacks.zen() end,                     { desc = "Toggle Zen Mode" })
map({"n", "x"}, "<leader>Z",  function() Snacks.zen.zoom() end,                { desc = "Toggle Zoom" })
map({"n", "x"}, "<leader>.",  function() Snacks.scratch() end,                 { desc = "Toggle Scratch Buffer" })
map({"n", "x"}, "<leader>S",  function() Snacks.scratch.select() end,          { desc = "Select Scratch Buffer" })
map({"n", "x"}, "<leader>n",  function() Snacks.notifier.show_history() end,   { desc = "Notification History" })
map({"n", "x"}, "<leader>bd", function() Snacks.bufdelete() end,               { desc = "Delete Buffer" })
map({"n", "x"}, "<leader>cR", function() Snacks.rename.rename_file() end,      { desc = "Rename File" })
map({"n", "x"}, "<leader>gB", function() Snacks.gitbrowse() end,               { desc = "Git Browse" })
map({"n", "x"}, "<leader>gg", function() Snacks.lazygit() end,                 { desc = "Lazygit" })
map({"n", "x"}, "<leader>un", function() Snacks.notifier.hide() end,           { desc = "Dismiss All Notifications" })
map({"n", "x"}, "<c-/>",      function() Snacks.terminal() end,                { desc = "Toggle Terminal" })
map({"n", "x"}, "<c-_>",      function() Snacks.terminal() end,                { desc = "which_key_ignore" })
map({"n", "x"}, "]]",         function() Snacks.words.jump(vim.v.count1) end,  { desc = "Next Reference" })
map({"n", "x"}, "[[",         function() Snacks.words.jump(-vim.v.count1) end, { desc = "Prev Reference" })

-- Digraphs
map({"i"}, "<M-e>",   "<C-k>'",  { desc = "Letter with acute" })
map({"i"}, "<M-`>",   "<C-k>`",  { desc = "Letter with grave" })
map({"i"}, "<M-i>",   "<C-k>^",  { desc = "Letter with circumflex" })
map({"i"}, "<M-c>",   "<C-k>,c", { desc = "Small letter c with cedilla" })
map({"i"}, "<M-S-c>", "<C-k>,C", { desc = "Capital letter c with cedilla" })
map({"i"}, "<M-u>",   "<C-k>:",  { desc = "Letter with diaresis" })

vim.keymap.set("i", "<M-n>", function()
  local key = vim.fn.nr2char(vim.fn.getchar())
  return "<C-k>" .. key .. "?"
end, { expr = true, noremap = true, desc = "Letter with tilde" })

-- Panel split
map("n", "<leader>sv", "<cmd>vsplit<cr>", { silent = true })
map("n", "<leader>sh", "<cmd>split<cr>",  { silent = true })

-- dap

map('n', '<F5>',   '<cmd>lua require("dap").continue()<cr>',  { silent = true, desc = 'DAP: Start/Continue debugging' })
map('n', '<S-F5>', '<cmd>lua require("dap").close()<cr>',  	  { silent = true, desc = 'DAP: Start/Continue debugging' })
map('n', '<F10>',  '<cmd>lua require("dap").step_over()<cr>', { silent = true, desc = 'DAP: Step over' })
map('n', '<F11>',  '<cmd>lua require("dap").step_into()<cr>', { silent = true, desc = 'DAP: Step into' })
map('n', '<F12>',  '<cmd>lua require("dap").step_out()<cr>',  { silent = true, desc = 'DAP: Step out' })

map('n', '<Leader>b', '<cmd>lua require("dap").toggle_breakpoint()<cr>', { silent = true, desc = 'DAP: Toggle breakpoint' })
map('n', '<Leader>B', function()
  require("dap").set_breakpoint(vim.fn.input("Breakpoint condition: "))
end, { silent = true, desc = 'DAP: Set conditional breakpoint' })

map('n', '<Leader>lp', function()
  require("dap").set_breakpoint(nil, nil, vim.fn.input("Log point message: "))
end, { silent = true, desc = 'DAP: Set log point' })

map('n', '<Leader>dr', '<cmd>lua require("dap").repl().open()<cr>', { silent = true, desc = 'DAP: Open REPL' })
map('n', '<Leader>dl', '<cmd>lua require("dap").run_last()<cr>',    { silent = true, desc = 'DAP: Run last configuration' })
