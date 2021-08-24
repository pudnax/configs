-- THESE ARE EXAMPLE CONFIGS FEEL FREE TO CHANGE TO WHATEVER YOU WANT

-- general
lvim.format_on_save = true
lvim.lint_on_save = true
lvim.colorscheme = "spacegray"

-- vim.api.nvim_exec([[
--     map H ^
--     map L $
-- ]], false)

-- keymappings [view all the defaults by pressing <leader>Lk]
lvim.leader = "space"
-- add your own keymapping
lvim.keys.normal_mode["<C-s>"] = ":w<cr>"
lvim.keys.normal_mode["<leader><leader>"] = "<C-^>"
lvim.keys.normal_mode["<S-h>"] = "^"
lvim.keys.normal_mode["<S-l>"] = "$"
lvim.keys.visual_mode["<S-h>"] = "^"
lvim.keys.visual_mode["<S-l>"] = "$"
-- unmap a default keymapping
-- lvim.keys.normal_mode["<C-Up>"] = ""
-- edit a default keymapping
-- lvim.keys.normal_mode["<C-q>"] = ":q<cr>"
lvim.wrap = false

-- Use which-key to add extra bindings with the leader-key prefix
lvim.builtin.which_key.mappings["Space"] = "Toggle Between Buffers"
-- lvim.builtin.which_key.mappings["P"] = { "<cmd>lua require'telescope'.extensions.project.project{}<CR>", "Projects" }
-- lvim.builtin.which_key.mappings["t"] = {
--   name = "+Trouble",
--   r = { "<cmd>Trouble lsp_references<cr>", "References" },
--   f = { "<cmd>Trouble lsp_definitions<cr>", "Definitions" },
--   d = { "<cmd>Trouble lsp_document_diagnostics<cr>", "Diagnosticss" },
--   q = { "<cmd>Trouble quickfix<cr>", "QuickFix" },
--   l = { "<cmd>Trouble loclist<cr>", "LocationList" },
--   w = { "<cmd>Trouble lsp_workspace_diagnostics<cr>", "Diagnosticss" },
-- }

-- TODO: User Config for predefined plugins
-- After changing plugin config exit and reopen LunarVim, Run :PackerInstall :PackerCompile
lvim.builtin.dashboard.active = true
lvim.builtin.terminal.active = true
lvim.builtin.nvimtree.side = "left"
lvim.builtin.nvimtree.show_icons.git = 0

-- if you don't want all the parsers change this to a table of the ones you want
lvim.builtin.treesitter.ensure_installed = {}
lvim.builtin.treesitter.ignore_install = { "haskell" }
lvim.builtin.treesitter.highlight.enabled = true

-- generic LSP settings
-- you can set a custom on_attach function that will be used for all the language servers
-- See <https://github.com/neovim/nvim-lspconfig#keybindings-and-completion>
-- lvim.lsp.on_attach_callback = function(client, bufnr)
--   local function buf_set_option(...)
--     vim.api.nvim_buf_set_option(bufnr, ...)
--   end
--   --Enable completion triggered by <c-x><c-o>
--   buf_set_option("omnifunc", "v:lua.vim.lsp.omnifunc")
-- end

-- set a formatter if you want to override the default lsp one (if it exists)
lvim.lang.python.formatters = {
  {
    exe = "black",
    args = {}
  }
}
-- set an additional linter
lvim.lang.python.linters = {
  {
    exe = "flake8",
    args = {}
  }
}

-- Autocommands (https://neovim.io/doc/user/autocmd.html)
-- lvim.autocommands.custom_groups = {
--   { "BufWinEnter", "*.lua", "setlocal ts=8 sw=8" },
-- }

-- Additional Plugins
lvim.lsp.override = { "rust" }
lvim.plugins = {
    {"folke/tokyonight.nvim"},
    {
        "ray-x/lsp_signature.nvim",
        config = function() require"lsp_signature".on_attach() end,
        event = "InsertEnter"
    },
	  { "liuchengxu/vista.vim" },
	  { "rhysd/clever-f.vim" },
	  { "ron-rs/ron.vim" },
	  { "tikhomirov/vim-glsl" },
	  { "dyng/ctrlsf.vim" },
	  { "mattn/webapi-vim" },
	  { "bronson/vim-trailing-whitespace" },
	  { "lukas-reineke/indent-blankline.nvim" },
	  { "tpope/vim-fugitive" },
	  { "steelsojka/pears.nvim" },
	  { "vimwiki/vimwiki" },
    {
      "simrat39/rust-tools.nvim",
      config = function()
          local status_ok, rust_tools = pcall(require, "rust-tools")
          if not status_ok then
            return
          end

          local opts = {
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
                other_hints_prefix = "=>",

                -- whether to align to the lenght of the longest line in the file
                max_len_align = false,

                -- padding from the left if max_len_align is true
                max_len_align_padding = 1,

                -- whether to align to the extreme right or not
                right_align = false,

                -- padding from the right if right_align is true
                right_align_padding = 7,
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
              cmd = { DATA_PATH .. "/lspinstall/rust/rust-analyzer" },
              on_attach = require("lsp").common_on_attach,
              settings = {
			        		["rust-analyzer"] = {
			        			checkOnSave = {
			        				command = "clippy",
			                },
			            },
			        },
            }, -- rust-analyser options
          }
          rust_tools.setup(opts)
      end,
      ft = { "rust", "rs" }, -- or you can not lazy load and remove this line
    },
}

-- Autocommands
lvim.autocommands.custom_groups = {
  -- c, cpp
  { "Filetype", "c,cpp", "nnoremap <leader>m <cmd>lua require('core.terminal')._exec_toggle('make;read')<CR>"},
  { "Filetype", "c,cpp", "nnoremap <leader>r <cmd>lua require('core.terminal')._exec_toggle('make run;read')<CR>"},
  { "Filetype", "c,cpp", "nnoremap <leader>t <cmd>lua require('toggleterm.terminal').Terminal:new {cmd='make test;read', hidden =false}:toggle()<CR>"},
  { "Filetype", "cpp", "nnoremap <leader>H <Cmd>ClangdSwitchSourceHeader<CR>" },

  -- rust
  { "Filetype", "rust", "nnoremap <leader>m <cmd>lua require('core.terminal')._exec_toggle('cargo build;read')<CR>"},
  { "Filetype", "rust", "nnoremap <leader>r <cmd>lua require('core.terminal')._exec_toggle('cargo run;read')<CR>"},
  { "Filetype", "rust", "nnoremap <leader>t <cmd>lua require('toggleterm.terminal').Terminal:new {cmd='cargo test -- --ignored;read', hidden =false}:toggle()<CR>"},
  { "Filetype", "rust", "nnoremap <leader>H <cmd>lua require('core.terminal')._exec_toggle('cargo clippy;read')<CR>"},

  -- glsl
  { "Filetype", "glsl", "map", "<C-K>", ":pyf ~/bins/clang-format.py<cr>" },

  -- python
  { "Filetype", "python", "nnoremap <leader>r <cmd>lua require('core.terminal')._exec_toggle('python " .. vim.fn.expand("%") .. ";read')<CR>"},
  { "Filetype", "python", "nnoremap <leader>t <cmd>lua require('toggleterm.terminal').Terminal:new {cmd='python -m test -j0;read', hidden =false}:toggle()<CR>"},
  { "Filetype", "python", "nnoremap <leader>m <cmd>lua require('core.terminal')._exec_toggle('echo \"compile :pepelaugh:\";read')<CR>"},
}

lvim.builtin.which_key.mappings["r"] = "Run"
lvim.builtin.which_key.mappings["m"] = "Make"
lvim.builtin.which_key.mappings["t"] = "Test"
lvim.builtin.which_key.mappings["H"] = "Help"
