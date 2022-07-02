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
require("autocommands")
require("settings")
require("keymappings")

require("telescope").load_extension("ui-select")

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
    "tsserver",
    -- "eslint",
    -- "omnisharp",
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

local lspconfig = require("lspconfig")
local configs = require("lspconfig.configs")

if not configs.wgsl_analyzer then
    configs.wgsl_analyzer = {
        default_config = {
            cmd = { vim.fn.expand("$HOME") .. "/.cargo/bin/wgsl_analyzer" },
            filetypes = { "wgsl" },
            root_dir = lspconfig.util.root_pattern(".git", "wgsl"),
            settings = {},
        },
    }
end

lspconfig.wgsl_analyzer.setup({
    on_attach = lsp_opts.on_attach,
    capabilities = lsp_opts.capabilities,
})

local sumneko_root_path = vim.fn.stdpath("data") .. "/lsp_servers/sumneko_lua/extension/server"
local sumneko_binary = sumneko_root_path .. "/bin/lua-language-server"

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

vim.api.nvim_exec([[filetype plugin indent on]], false)
vim.bo.shiftwidth = 4
vim.bo.softtabstop = 0
vim.bo.tabstop = 4
vim.bo.expandtab = true
vim.o.smarttab = true
