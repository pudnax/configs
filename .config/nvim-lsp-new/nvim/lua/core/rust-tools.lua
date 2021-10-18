local M = {}
M.opts = {
	tools = { -- rust-tools options
		-- automatically set inlay hints (type hints)
		-- There is an issue due to which the hints are not applied on the first
		-- opened file. For now, write to the file to trigger a reapplication of
		-- the hints or just run :RustSetInlayHints.
		-- default: true
		autoSetHints = true,

		-- whether to show hover actions inside the hover window
		-- this overrides the default hover handler
		-- default: true
		hover_with_actions = true,

		runnables = {
			-- whether to use telescope for selection menu or not
			-- default: true
			use_telescope = true,

			-- rest of the opts are forwarded to telescope
		},

		inlay_hints = {
			-- wheter to show parameter hints with the inlay hints or not
			-- default: true
			show_parameter_hints = true,

			-- prefix for parameter hints
			-- default: "<-"
			parameter_hints_prefix = "<-",

			-- prefix for all the other hints (type, chaining)
			-- default: "=>"
			other_hints_prefix = "=> ",

			-- whether to align to the lenght of the longest line in the file
			max_len_align = false,

			-- padding from the left if max_len_align is true
			max_len_align_padding = 1,

			-- whether to align to the extreme right or not
			right_align = false,

			-- padding from the right if right_align is true
			right_align_padding = 7,

			highlight = "Comment",
		},

		hover_actions = {
			-- the border that is used for the hover window
			-- see vim.api.nvim_open_win()
			border = {
				{ "╭", "FloatBorder" },
				{ "─", "FloatBorder" },
				{ "╮", "FloatBorder" },
				{ "│", "FloatBorder" },
				{ "╯", "FloatBorder" },
				{ "─", "FloatBorder" },
				{ "╰", "FloatBorder" },
				{ "│", "FloatBorder" },
			},
		},
	},

	-- all the opts to send to nvim-lspconfig
	-- these override the defaults set by rust-tools.nvim
	-- see https://github.com/neovim/nvim-lspconfig/blob/master/CONFIG.md#rust_analyzer
	server = {
		cmd = { vim.fn.stdpath("data") .. "/lsp_servers/rust/rust-analyzer" },
		on_attach = require("core.lsp_opts").on_attach,
		capabilities = require("core.lsp_opts").capabilities,
		settings = {
			["rust-analyzer"] = {
				assits = {
					importMergeBehaviour = "last",
					importPrefix = "by_self",
				},
				diagnostics = {
					disabled = { "unresolved-import" },
				},
				cargo = {
					loadOutDirFromCheck = true,
				},
				procMacro = {
					enbale = true,
				},
				checkOnSave = {
					command = "clippy",
				},
			},
		},
	}, -- rust-analyser options
}

M.setup = function()
	local status_ok, rust_tools = pcall(require, "rust-tools")
	if not status_ok then
		return
	end

	rust_tools.setup(M.opts)
end

return M
