local dap = require('dap')

-- macOS arm64: binário nativo do plugin netcoredbg-macOS-arm64.nvim (o do Mason é x86_64).
-- Demais sistemas (Linux/WSL/Windows): netcoredbg do Mason (:MasonInstall netcoredbg).
local function netcoredbg_path()
	local arm_plugin = vim.g.plugs and vim.g.plugs['netcoredbg-macOS-arm64.nvim']
	if arm_plugin then
		local bin = vim.fs.joinpath(arm_plugin.dir, 'netcoredbg', 'netcoredbg')
		if vim.fn.executable(bin) == 1 then
			return bin
		end
	end
	local path = vim.fn.exepath('netcoredbg')
	if path ~= '' then
		return path
	end
	local ext = vim.fn.has('win32') == 1 and '.cmd' or ''
	return vim.fs.joinpath(vim.fn.stdpath('data'), 'mason', 'bin', 'netcoredbg' .. ext)
end

-- Le um arquivo .env para uma tabela
local function load_env_file(path)
	local env = {}
	local file = io.open(path, 'r')
	if not file then
		return env
	end
	for line in file:lines() do
		line = line:gsub('\r$', '') -- .env salvo com CRLF (Windows)
		local key, value = line:match('^%s*([%w_]+)%s*=%s*(.+)%s*$')
		if key and value then
			value = value:gsub('^"(.*)"$', '%1'):gsub("^'(.*)'$", '%1')
			env[key] = value
		end
	end
	file:close()
	return env
end

-- Procura o dll em bin/Debug/net*/<NomeDaPasta>.dll
local function get_dll_path()
	local dir = vim.fn.expand('%:p:h')
	local debug_path = vim.fs.joinpath(dir, 'bin', 'Debug')
	if vim.fn.isdirectory(debug_path) == 0 then
		return vim.fn.getcwd() .. '/'
	end
	local name = vim.fs.basename(dir)
	local matches = vim.fn.glob(debug_path .. '/net*/' .. name .. '.dll', false, true)
	if #matches > 0 then
		return matches[1]
	end
	return debug_path .. '/'
end

local env_vars = {}
local env_path = vim.fs.joinpath(vim.fn.getcwd(), '.env')
if vim.uv.fs_stat(env_path) then
	env_vars = load_env_file(env_path)
end

-- Chaves obrigatorias: pergunta ao iniciar se nao estiverem no .env
local required_envs = {
	ASPNETCORE_ENVIRONMENT = 'Development',
	ASPNETCORE_URL = 'http://localhost:5000',
}
for key, default in pairs(required_envs) do
	if not env_vars[key] or env_vars[key] == '' then
		env_vars[key] = function()
			return vim.fn.input(key .. ': ', default)
		end
	end
end

local adapter = {
	type = 'executable',
	command = netcoredbg_path(),
	args = { '--interpreter=vscode' },
}
dap.adapters.coreclr = adapter
dap.adapters.netcoredbg = adapter

dap.configurations.cs = {
	{
		type = 'coreclr',
		name = 'NetCoreDbg: Launch',
		request = 'launch',
		cwd = '${fileDirname}',
		program = function()
			return vim.fn.input('Path to dll: ', get_dll_path(), 'file')
		end,
		env = env_vars,
	},
}
