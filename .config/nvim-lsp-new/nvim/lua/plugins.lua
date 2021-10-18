return require("packer").startup(function(use)
	use({ "wbthomason/packer.nvim" })

	-- Collection of common configurations for the Nvim LSP client
	use({ "neovim/nvim-lspconfig" })

	use({
		"windwp/nvim-autopairs",
		config = function()
			require("nvim-autopairs").setup({})
		end,
	})

	-- Completion framework
	use({
		"hrsh7th/nvim-cmp",
		requires = {
			"hrsh7th/cmp-nvim-lsp",
			"hrsh7th/cmp-nvim-lua",
			"L3MON4D3/LuaSnip",
			"hrsh7th/cmp-path",
			"hrsh7th/cmp-buffer",
			"hrsh7th/cmp-calc",
			"saadparwaiz1/cmp_luasnip",
			"hrsh7th/cmp-latex-symbols",
		},
		config = function()
			require("core.cmp").setup()
			require("nvim-autopairs.completion.cmp").setup({
				map_cr = true, --  map <CR> on insert mode
				map_complete = true, -- it will auto insert `(` (map_char) after select function or method item
				auto_select = true, -- automatically select the first item
				insert = false, -- use insert confirm behavior instead of replace
				map_char = { -- modifies the function or method delimiter by filetypes
					all = "(",
					tex = "{",
				},
			})
		end,
	})

	use({
		"rafamadriz/friendly-snippets",
	})

	-- To enable more of the features of rust-analyzer, such as inlay hints and more!
	use({
		"simrat39/rust-tools.nvim",
		requires = { "neovim/nvim-lspconfig" },
		config = function()
			require("core.rust-tools").setup()
		end,
		ft = { "rust", "rs" }, -- or you can not lazy load and remove this line
	})

	-- Fuzzy finder
	use({ "nvim-lua/popup.nvim" })
	use({ "nvim-lua/plenary.nvim" })
	use({
		"nvim-telescope/telescope.nvim",
		config = function()
			local map = require("util").map
			map("n", "<C-p>", '<cmd>lua require("telescope.builtin").find_files()<CR>')
			map("n", "<leader>ff", '<cmd>lua require("telescope.builtin").grep_string()<CR>')
			map("n", "<leader>fg", '<cmd>lua require("telescope.builtin").live_grep()<CR>')
			require("core.telescope").setup()
		end,
	})
	use({
		"nvim-telescope/telescope-fzf-native.nvim",
		run = "make",
	})
	use({
		"nvim-telescope/telescope-frecency.nvim",
		requires = { "tami5/sql.nvim" },
		config = function()
			require("telescope").load_extension("frecency")
		end,
	})
	use({ "nvim-telescope/telescope-symbols.nvim" })
	use({ "nvim-telescope/telescope-github.nvim" })
	-- use {
	--     'nvim-telescope/telescope-arecibo.nvim',
	--     rocks = {"openssl", "lua-http-parser"}
	-- }
	use({ "nvim-telescope/telescope-media-files.nvim" })
	-- use { 'nvim-telescope/telescope-packer.nvim ' }

	-- Color scheme used in the GIFs!
	use({ "arcticicestudio/nord-vim" })

	-- dev: Auto reload config
	use({ "famiu/nvim-reload" })

	-- Fetch versions from crates.io
	use({
		"Saecki/crates.nvim",
		event = { "BufRead Cargo.toml" },
		requires = { { "nvim-lua/plenary.nvim" } },
		config = function()
			require("crates").setup()
		end,
	})

	-- Language servers insteller
	use({ "williamboman/nvim-lsp-installer" })

	-- Git
	use({
		"tpope/vim-fugitive",
		cmd = {
			"G",
			"Git",
			"Gdiffsplit",
			"Gread",
			"Gwrite",
			"Ggrep",
			"GMove",
			"GDelete",
			"GBrowse",
			"GRemove",
			"GRename",
			"Glgrep",
			"Gedit",
		},
		config = function()
			local map = require("util").map
			map("n", "<leader>gh", "<cmd>diffget //3<CR>")
			map("n", "<leader>gf", "<cmd>diffget //2<CR>")
		end,
		ft = { "fugitive" },
	})

	-- Comments
	use({ "tpope/vim-commentary" })

	-- Add git related info in the signs columns and popups
	use({
		"lewis6991/gitsigns.nvim",
		requires = { "nvim-lua/plenary.nvim" },
		config = function()
			require("gitsigns").setup({
				signs = {
					add = { hl = "GitGutterAdd", text = "+" },
					change = { hl = "GitGutterChange", text = "~" },
					delete = { hl = "GitGutterDelete", text = "_" },
					topdelete = { hl = "GitGutterDelete", text = "‾" },
					changedelete = { hl = "GitGutterChange", text = "~" },
				},
			})
		end,
	})

	-- Highlight, edit, and navigate code using a fast incremental parsing library
	use({
		"nvim-treesitter/nvim-treesitter",
		-- branch = "0.5-compat",
		-- run = ":TSUpdate",
		config = function()
			require("core.treesitter").setup()

			local map = require("util").map
			map("n", "<leader>e", "<cmd>NvimTreeToggle<CR>")
		end,
	})
	-- Additional textobjects for treesitter
	use({ "nvim-treesitter/nvim-treesitter-textobjects" })

	-- File tree
	use({
		"kyazdani42/nvim-tree.lua",
		requires = "kyazdani42/nvim-web-devicons",
		config = function()
			require("core.nvim-tree").setup()
		end,
	})

	use({
		"mhartington/formatter.nvim",
		config = function()
			require("core.formatter").setup()
			vim.api.nvim_exec(
				[[
                augroup FormatAutogroup
                  autocmd!
                  autocmd BufWritePost *.js,*.lua,*.c,*.cpp,*.h,*.hpp, FormatWrite
                augroup END
                ]],
				true
			)
		end,
	})

	-- Terminal
	use({
		"akinsho/toggleterm.nvim",
		event = "BufWinEnter",
		config = function()
			require("core.terminal").setup()
		end,
	})

	use({
		"ray-x/lsp_signature.nvim",
		event = "BufRead",
		config = function()
			require("lsp_signature").setup()
		end,
	})

	use({
		"phaazon/hop.nvim",
		event = "BufRead",
		config = function()
			require("hop").setup()
			vim.api.nvim_set_keymap("n", "s", ":HopChar2<cr>", { silent = true })
			vim.api.nvim_set_keymap("n", "S", ":HopWord<cr>", { silent = true })
		end,
	})

	use({
		"kevinhwang91/rnvimr",
		cmd = "RnvimrToggle",
		config = function()
			vim.g.rnvimr_draw_border = 1
			vim.g.rnvimr_pick_enable = 1
			vim.g.rnvimr_bw_enable = 1
		end,
	})

	use({
		"andymass/vim-matchup",
		event = "CursorMoved",
		config = function()
			vim.g.matchup_matchparen_offscreen = { method = "popup" }
		end,
	})

	use({
		"metakirby5/codi.vim",
		cmd = "Codi",
	})

	use({
		"monaqa/dial.nvim",
		event = "BufRead",
		config = function()
			local dial = require("dial")
			vim.cmd([[
		      nmap <C-a> <Plug>(dial-increment)
		      nmap <C-x> <Plug>(dial-decrement)
		      vmap <C-a> <Plug>(dial-increment)
		      vmap <C-x> <Plug>(dial-decrement)
		      vmap g<C-a> <Plug>(dial-increment-additional)
		      vmap g<C-x> <Plug>(dial-decrement-additional)
		    ]])

			dial.augends["custom#boolean"] = dial.common.enum_cyclic({
				name = "boolean",
				strlist = { "true", "false" },
			})
			table.insert(dial.config.searchlist.normal, "custom#boolean")

			-- For Languages which prefer True/False, e.g. python.
			dial.augends["custom#Boolean"] = dial.common.enum_cyclic({
				name = "Boolean",
				strlist = { "True", "False" },
			})
			table.insert(dial.config.searchlist.normal, "custom#Boolean")
		end,
	})

	use({
		"npxbr/glow.nvim",
		ft = { "markdown" },
		-- run = "yay -S glow"
	})

	use({ "oberblastmeister/neuron.nvim" })
	use({ "mattn/webapi-vim" })
	use({ "rhysd/clever-f.vim" })
	use({ "ron-rs/ron.vim" })
	use({ "liuchengxu/vista.vim" })
	use({ "DingDean/wgsl.vim" })
	use({ "tikhomirov/vim-glsl" })
	use({ "bronson/vim-trailing-whitespace" })

	use({
		"ethanholz/nvim-lastplace",
		event = "BufRead",
		config = function()
			require("nvim-lastplace").setup({
				lastplace_ignore_buftype = { "quickfix", "nofile", "help" },
				lastplace_ignore_filetype = {
					"gitcommit",
					"gitrebase",
					"svn",
					"hgcommit",
				},
				lastplace_open_folds = true,
			})
		end,
	})

	use({
		"rmagatti/goto-preview",
		config = function()
			require("goto-preview").setup({
				width = 120, -- Width of the floating window
				height = 25, -- Height of the floating window
				default_mappings = false, -- Bind default mappings
				debug = false, -- Print debug information
				opacity = nil, -- 0-100 opacity level of the floating window where 100 is fully transparent.
				post_open_hook = nil, -- A function taking two arguments, a buffer and a window to be ran as a hook.
				-- You can use "default_mappings = true" setup option
				-- Or explicitly set keybindings
				vim.cmd("nnoremap gpd <cmd>lua require('goto-preview').goto_preview_definition()<CR>"),
				vim.cmd("nnoremap gpi <cmd>lua require('goto-preview').goto_preview_implementation()<CR>"),
				vim.cmd("nnoremap gP <cmd>lua require('goto-preview').close_all_win()<CR>"),
			})
		end,
	})

	use({
		"nacro90/numb.nvim",
		event = "BufRead",
		config = function()
			require("numb").setup({
				show_numbers = true, -- Enable 'number' for the window while peeking
				show_cursorline = true, -- Enable 'cursorline' for the window while peeking
			})
		end,
	})

	use({
		"windwp/nvim-spectre",
		event = "BufRead",
		config = function()
			require("spectre").setup()
		end,
	})

	use({
		"kevinhwang91/nvim-bqf",
		event = { "BufRead", "BufNew" },
		config = function()
			require("bqf").setup({
				auto_enable = true,
				preview = {
					win_height = 12,
					win_vheight = 12,
					delay_syntax = 80,
					border_chars = { "┃", "┃", "━", "━", "┏", "┓", "┗", "┛", "█" },
				},
				func_map = {
					vsplit = "",
					ptogglemode = "z,",
					stoggleup = "",
				},
				filter = {
					fzf = {
						action_for = { ["ctrl-s"] = "split" },
						extra_opts = { "--bind", "ctrl-o:toggle-all", "--prompt", "> " },
					},
				},
			})
		end,
	})

	use({
		"lukas-reineke/indent-blankline.nvim",
		event = "BufRead",
		setup = function()
			vim.g.indentLine_enabled = 1
			vim.g.indent_blankline_char = "▏"
			vim.g.indent_blankline_filetype_exclude = { "help", "terminal", "dashboard" }
			vim.g.indent_blankline_buftype_exclude = { "terminal" }
			vim.g.indent_blankline_show_trailing_blankline_indent = false
			vim.g.indent_blankline_show_first_indent_level = false
		end,
	})

	use({
		"folke/trouble.nvim",
		cmd = "TroubleToggle",
		config = function()
			local map = require("util").map
			map("n", "<leader>r", "<cmd>Trouble lsp_references<cr>")
			map("n", "<leader>f", "<cmd>Trouble lsp_definitions<cr>")
			map("n", "<leader>d", "<cmd>Trouble lsp_document_diagnostics<cr>")
			map("n", "<leader>q", "<cmd>Trouble quickfix<cr>")
			map("n", "<leader>l", "<cmd>Trouble loclist<cr>")
			map("n", "<leader>w", "<cmd>Trouble lsp_workspace_diagnostics<cr>")
		end,
	})

	use({
		"simrat39/symbols-outline.nvim",
		config = function()
			vim.g.symbols_outline = { auto_preview = false, width = 13 }
			local map = require("util").map
			map("n", "<F8>", "<cmd>SymbolsOutline<CR>")
		end,
	})
end)
