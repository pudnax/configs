local utils = require('utils')

local cmd = vim.cmd
local o = vim.o
local wo = vim.wo
local bo = vim.bo
local indent = 4

cmd 'syntax enable'
cmd 'filetype plugin indent on'

-- Use wide tabs
bo.shiftwidth = indent
bo.softtabstop = indent
bo.tabstop = indent
bo.expandtab = true
o.smarttab = true

--Incremental live completion
o.inccommand = "nosplit"

--Set highlight on search
o.hlsearch = true 
o.incsearch = true

--Make line numbers default
wo.number = true
wo.relativenumber = true

--Do not save when switching buffers
o.hidden = true

--Enable mouse mode
o.mouse = "a"

--Enable break indent
-- o.breakindent = true

--Case insensitive searching UNLESS /C or capital in search
o.ignorecase = true
o.smartcase = true
o.gdefault = true

-- " Wrapping options
-- tc wrap text and comments using textwidth
-- r  continue comments when pressing ENTER in I mode
-- q  enable formatting of comments with gq
-- n  detect lists for formatting
-- b  auto-wrap in insert mode, and do not wrap old long lines
bo.formatoptions = "tcrqnb"

-- Let's us yanc content in vim and then paste to other programs
o.clipboard = 'unnamed,unnamedplus'

-- Permanent undo
cmd[[set undodir=~/.vimdid]]
cmd[[set undofile]]

wo.signcolumn = 'yes'
o.encoding = 'utf-8'
o.printencoding = 'utf-8'
o.printoptions = 'paper:letter'

-- No wrap
o.joinspaces = false

-- Remove toolbar
-- o.guioptions = o.guioptions - {'T'}

-- UI
vim.g.base16colorspace = 256
o.background = 'dark'
o.backspace = '2'
o.lazyredraw = true
o.diffopt = o.diffopt .. ',iwhite'
o.diffopt = o.diffopt .. ',algorithm:patience'
o.diffopt = o.diffopt .. ',indent-heuristic'
o.listchars = o.listchars .. ',nbsp:¬,extends:»,precedes:«,trail:•'
o.scrolloff = 5
o.sidescrolloff = 5
o.showmatch = true
o.matchtime = 2
o.errorbells = false
o.visualbell = false
o.splitbelow = true
o.splitright = true
bo.synmaxcol = 500
wo.colorcolumn = '80'
o.cmdheight = 2

o.timeoutlen = 500
o.updatetime = 300

-- Search results centered please
utils.map('n', 'n', 'nzz', {silent = true})
utils.map('n', 'N', 'Nzz', {silent = true})
utils.map('n', '*', '*zz', {silent = true})
utils.map('n', '#', '#zz', {silent = true})
utils.map('n', 'g*', 'g*zz', {silent = true})

-- Very magic by default
-- utils.map('n', '?', '?\v', {})
-- utils.map('n', '/', '/\v', {})
-- utils.map('c', '%s/', '%sm/', {})

cmd [[
set path+=**
set wildmenu
set wildignore+=*.pyc
set wildignore+=*_build/*
set wildignore+=**/coverage/*
set wildignore+=**/node_modules/*
set wildignore+=**/android/*
set wildignore+=**/ios/*
set wildignore+=**/.git/*
]]

-- Highlight on yank
cmd 'au TextYankPost * silent! lua vim.highlight.on_yank()'

vim.api.nvim_exec([[
augroup auto_spellcheck
    autocmd!
    autocmd BufNewFile,BufRead *.md setlocal spell
    autocmd BufNewFile,BufRead *.org setfiletype markdown
    autocmd BufNewFile,BufRead *.org setlocal spell
augroup END
]], false)

-- AutoTrip whitespaces
vim.api.nvim_exec([[
    fun! TrimWhitespace()
        let l:save = winsaveview()
        keeppatterns %s/\s\+$//e
        call winrestview(l:save)
    endfun

    autocmd FileType go,rust,html,typescript,javascript,python autocmd BufWritePre <buffer> call TrimWhitespace()
]], false)

-- -- Auto format
-- vim.api.nvim_exec([[
-- augroup auto_fmt
--     autocmd!
--     autocmd BufWritePre *.py,*.lua try | undojoin | Neoformat | catch /^Vim\%((\a\+)\)\=:E790/ | finally | silent Neoformat | endtry
-- aug END
-- ]], false)
