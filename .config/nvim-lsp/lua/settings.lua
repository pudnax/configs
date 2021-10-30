local cmd = vim.cmd

cmd("filetype plugin on")
cmd("set completeopt=menu,menuone,noselect")
cmd("set shortmess+=c")

--Incremental live completion (note: this is now a default on master)
vim.o.inccommand = "nosplit"

--Set highlight on search
vim.o.hlsearch = true
vim.o.incsearch = true

--Make line numbers default
vim.wo.number = true
vim.wo.relativenumber = true

--Do not save when switching buffers (note: this is now a default on master)
vim.o.hidden = true

--Enable mouse mode
vim.o.mouse = "a"

-- " Wrapping options
-- tc wrap text and comments using textwidth
-- r  continue comments when pressing ENTER in I mode
-- q  enable formatting of comments with gq
-- n  detect lists for formatting
-- b  auto-wrap in insert mode, and do not wrap old long lines
vim.bo.formatoptions = "tcrqnb"

-- Let's us yanc content in vim and then paste to other programs
vim.o.clipboard = "unnamed,unnamedplus"

-- Permanent undo
cmd([[set undodir=~/.vimdid]])
cmd([[set undofile]])

--Encoding
vim.o.encoding = "utf-8"
vim.o.printencoding = "utf-8"
vim.o.printoptions = "paper:letter"

-- No wrap
vim.o.joinspaces = false

--Enable break indent
vim.o.breakindent = true

--Save undo history
vim.opt.undofile = true

--Case insensitive searching UNLESS /C or capital in search
vim.o.ignorecase = true
vim.o.smartcase = true

--Decrease update time
vim.o.updatetime = 250
vim.wo.signcolumn = "yes"

--Set colorscheme (order is important here)
vim.o.termguicolors = true
vim.g.onedark_terminal_italics = 2
-- vim.cmd([[colorscheme nord]])

--Remap space as leader key
vim.api.nvim_set_keymap("", "<Space>", "<Nop>", { noremap = true, silent = true })
vim.g.mapleader = " "
vim.g.maplocalleader = " "

--Ident
vim.bo.shiftwidth = 4
vim.bo.softtabstop = 4
vim.bo.tabstop = 4
vim.bo.expandtab = true
vim.o.smarttab = true

-- Highlight on yank
vim.api.nvim_exec(
	[[
  augroup YankHighlight
    autocmd!
    autocmd TextYankPost * silent! lua vim.highlight.on_yank()
  augroup end
]],
	false
)

-- UI
vim.g.base16colorspace = 256
vim.o.background = "dark"
vim.o.backspace = "2"
vim.o.lazyredraw = true
vim.o.diffopt = vim.o.diffopt .. ",iwhite"
vim.o.diffopt = vim.o.diffopt .. ",algorithm:patience"
vim.o.diffopt = vim.o.diffopt .. ",indent-heuristic"
vim.o.listchars = vim.o.listchars .. ",nbsp:¬,extends:»,precedes:«,trail:•"
vim.o.scrolloff = 5
vim.o.sidescrolloff = 5
vim.o.showmatch = true
vim.o.matchtime = 2
vim.o.errorbells = false
vim.o.visualbell = false
vim.o.splitbelow = true
vim.o.splitright = true
vim.bo.synmaxcol = 500
vim.wo.colorcolumn = "100"
vim.o.cmdheight = 2

-- AutoTrip whitespaces
vim.api.nvim_exec(
	[[
    fun! TrimWhitespace()
        let l:save = winsaveview()
        keeppatterns %s/\s\+$//e
        call winrestview(l:save)
    endfun

    function! QuickFixToggle()
    if empty(filter(getwininfo(), 'v:val.quickfix'))
    copen
    else
    cclose
    endif
    endfunction

    autocmd FileType lua,go,rust,c,c++,html,typescript,javascript,python autocmd BufWritePre <buffer> call TrimWhitespace()
]],
	false
)
