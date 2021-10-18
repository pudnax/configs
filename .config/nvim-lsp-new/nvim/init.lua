local fn = vim.fn
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
	packer_bootstrap = fn.system({
		"git",
		"clone",
		"--depth",
		"1",
		"https://github.com/wbthomason/packer.nvim",
		install_path,
	})
end

local packer_ok, packer = pcall(require, "packer")
if not packer_ok then
	return
end

packer.init({
	display = {
		open_fn = function()
			return require("packer.util").float({ border = "single" })
		end,
	},
})

require("plugins")
require("keymappings")
require("settings")
require("autocommands")

vim.cmd([[set shell=/bin/bash]])

local lsp_opts = require("core.lsp_opts")

local server_names = {
	"clangd",
	"pyright",
	"cmake",
	"zls",
	"texlab",
	"gopls",
	"jsonls",
}

local lsp_installer_servers = require("nvim-lsp-installer.servers")

for _, name in ipairs(server_names) do
	local ok, server = lsp_installer_servers.get_server(name)
	if ok then
		if not server:is_installed() then
			server:install()
		end
		local opts = {
			on_attach = lsp_opts.on_attach,
			capabilities = lsp_opts.capabilities,
		}
		server:setup(opts)
		-- vim.cmd([[]])
	end
end

local sumneko_root_path = vim.fn.stdpath("data") .. "/lsp_servers/sumneko_lua/extension/server"
local sumneko_binary = sumneko_root_path .. "/bin/Linux/lua-language-server"

-- Make runtime files discoverable to the server
local runtime_path = vim.split(package.path, ";")
table.insert(runtime_path, "lua/?.lua")
table.insert(runtime_path, "lua/?/init.lua")

require("lspconfig").sumneko_lua.setup({
	cmd = { sumneko_binary, "-E", sumneko_root_path .. "/main.lua" },
	on_attach = lsp_opts.on_attach,
	capabilities = lsp_opts.capabilities,
	settings = {
		Lua = {
			runtime = {
				-- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
				version = "LuaJIT",
				-- Setup your lua path
				path = runtime_path,
			},
			diagnostics = {
				-- Get the language server to recognize the `vim` global
				globals = { "vim" },
			},
			workspace = {
				-- Make the server aware of Neovim runtime files
				library = vim.api.nvim_get_runtime_file("", true),
			},
			-- Do not send telemetry data containing a randomized but unique identifier
			telemetry = {
				enable = false,
			},
		},
	},
})
