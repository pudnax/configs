" Space to leader
let mapleader = "\<Space>"
filetype indent on
set nocompatible

call plug#begin()

Plug 'Chiel92/vim-autoformat'
Plug 'vim-scripts/DrawIt'

" Plug 'dense-analysis/ale'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-sensible'
Plug 'nathanaelkane/vim-indent-guides'
Plug 'cespare/vim-toml'
Plug 'stephpy/vim-yaml'
Plug 'rust-lang/rust.vim'
Plug 'rhysd/vim-clang-format'
Plug 'mhinz/vim-crates'
Plug 'fatih/vim-go'

Plug 'raimondi/delimitmate'

Plug 'sheerun/vim-polyglot'

" Semantic language support
Plug 'neovim/nvim-lsp'
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" Theme
Plug 'chriskempson/base16-vim'

" NERD tree
Plug 'preservim/nerdtree'

" VIM enhancements
Plug 'ciaranm/securemodelines'
Plug 'editorconfig/editorconfig-vim'
Plug 'justinmk/vim-sneak'

" GUI enhancements
Plug 'itchyny/lightline.vim'
Plug 'machakann/vim-highlightedyank'
Plug 'andymass/vim-matchup'

" Fuzzy finder
Plug 'airblade/vim-rooter'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

" Markdown
Plug 'tpope/vim-markdown'

call plug#end()

set langmap=ФИСВУАПРШОЛДЬТЩЗЙКЫЕГМЦЧНЯ;ABCDEFGHIJKLMNOPQRSTUVWXYZ,фисвуапршолдьтщзйкыегмцчня;abcdefghijklmnopqrstuvwxyz

" Get syntax
syntax on

"Theme configuration
if !has('gui_running')
        set t_Co=256
endif
if (match($TERM, "-256color") != -1) && (match($TERM, "screen-256color") == -1)
        " screen does not (yet) support truecolor
        set termguicolors
endif
" Colors
set termguicolors
set background=dark
colorscheme base16-gruvbox-dark-hard

" Ale
" let g:ale_linters = {'rust': ['rustc', 'cargo']}
" let g:ale_rust_cargo_use_check=1
" let g:ale_rust_cargo_check_examples=1
" let g:ale_fixers = {
"                         \'*': ['remove_trailing_lines', 'trim_whitespace'],
"                         \'rust': ['rustfmt'],
"                         \}

" Lightline
let g:lightline = {
                        \ 'component_function': {
                        \   'filename': 'LightlineFilename',
                        \ },
                        \ }
function! LightlineFilename()
        return expand('%:t') !=# '' ? @% : '[No Name]'
endfunction

" from http://sheerun.net/2014/03/21/how-to-boost-your-vim-productivity/
if executable('ag')
        set grepprg=ag\ --nogroup\ --nocolor
endif
if executable('rg')
        set grepprg=rg\ --no-heading\ --vimgrep
        set grepformat=%f:%l:%c:%m
endif

" Completin
" Better display for messages
set cmdheight=2
" You will have bad experience for diagnostic messages when it's default 4000.
set updatetime=300

" setup rust_analyzer LSP (IDE features)
lua require'nvim_lsp'.rust_analyzer.setup{}

" Use LSP omni-completion in Rust files
autocmd Filetype rust setlocal omnifunc=v:lua.vim.lsp.omnifunc

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""'

nnoremap <leader>c :!cargo clippy


" NERD tree configuration
let g:NERDTreeShowHidden = 1
let g:NERDTreeMinimalUI = 1
let g:NERDTreeIgnore = []
let g:NERDTreeStatusline = ''

" Markdown
let g:vim_markdown_folding_disabled=1
let g:vim_markdown_math=1

" Expand tab into spaces:
set expandtab

" Make sure vim doesn't ask me to save before swapping between buffers:
set hidden

" Automaticaly close nvim if NERDTree is only thing left open
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" =============================================================================
" # Editor settings
" =============================================================================
filetype plugin indent on
set timeoutlen=300 " http://stackoverflow.com/questions/2158516/delay-before-o-opens-a-new-line
set encoding=utf-8
set scrolloff=4
set noshowmode
set hidden
set nowrap
set nojoinspaces
let g:sneak#s_next = 1
let g:vim_markdown_new_list_item_indent = 0
let g:vim_markdown_auto_insert_bullets = 0
let g:vim_markdown_frontmatter = 1
set printfont=:h10
set printencoding=utf-8
set printoptions=paper:letter
" Always draw sign column. Prevent buffer moving when adding/deleting sign.
set signcolumn=yes

" Settings needed for .lvimrc
set exrc
set secure

" Sane splits
set splitright
set splitbelow

" Permanent undo
set undodir=~/.vimdid
set undofile

" Decent wildmenu
set wildmenu
set wildmode=list:longest
set wildignore=.hg,.svn,*~,*.png,*.jpg,*.gif,*.settings,Thumbs.db,*.min.js,*.swp,publish/*,intermediate/*,*.o,*.hi,Zend,vendor

" Use wide tabs
" set shiftwidth=8
" set softtabstop=8
" set tabstop=8
" set noexpandtab

" Wrapping options
set formatoptions=tc " wrap text and comments using textwidth
set formatoptions+=r " continue comments when pressing ENTER in I mode
set formatoptions+=q " enable formatting of comments with gq
set formatoptions+=n " detect lists for formatting
set formatoptions+=b " auto-wrap in insert mode, and do not wrap old long lines

" Proper search
set incsearch
set ignorecase
set smartcase
set gdefault

" Search results centered please
nnoremap <silent> n nzz
nnoremap <silent> N Nzz
nnoremap <silent> * *zz
nnoremap <silent> # #zz
nnoremap <silent> g* g*zz

" Very magic by default
nnoremap ? ?\v
nnoremap / /\v
cnoremap %s/ %sm/
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" GUI configuration
"
"

set wrap linebreak nolist
set textwidth=90

set ttimeoutlen=10

set encoding=UTF-8
" Open hotkeys
map <C-p> :Files<CR>
nmap <leader>; :Buffers<CR>

" Quick-save
nmap <leader>w :w<CR>
" FZF open
nnoremap <C-p> :FZF<CR>
let g:fzf_action = {
                        \ 'ctrl-t': 'tab split',
                        \ 'ctrl-s': 'split',
                        \ 'ctrl-v': 'vsplit'
                        \}

set lazyredraw
set synmaxcol=500
set laststatus=2
set relativenumber " Relative line numbers
set number " Also show current absolute line

set diffopt+=iwhite " No whitespace in vimdiff

" Make diffing better: https://vimways.org/2018/the-power-of-diff/
set diffopt+=algorithm:patience
set diffopt+=indent-heuristic
set colorcolumn=80 " and give me a colored column
set showcmd " Show (partial) command in status line.
set mouse=a " Enable mouse usage (all modes) in terminals
" set shortmess+=c " don't give |ins-completion-menu| messages.

" Show those damn hidden characters
" Verbose: set listchars=nbsp:¬,eol:¶,extends:»,precedes:«,trail:•
set listchars=nbsp:¬,extends:»,precedes:«,trail:•


" =============================================================================
" # Keyboard shortcuts
" =============================================================================
" ; as :
nnoremap ; :

" 'Smart' nevigation
nmap <silent> E <Plug>(coc-diagnostic-prev)
nmap <silent> W <Plug>(coc-diagnostic-next)
nmap <silent> <leader>l <Plug>(coc-diagnostic-info)
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
" Use K to show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>
function! s:show_documentation()
        if (index(['vim','help'], &filetype) >= 0)
                execute 'h '.expand('<cword>')
        else
                call CocAction('doHover')
        endif
endfunction
" nmap <silent> F <Plug>(ale_lint)
" nmap <silent> <C-l> <Plug>(ale_detail)
" nmap <silent> <C-g> :close<cr>

" <leader>s for Rg search
noremap <leader>s :Rg
let g:fzf_layout = { 'down': '~20%' }
command! -bang -nargs=* Rg
                        \ call fzf#vim#grep(
                        \   'rg --column --line-number --no-heading --color=always '.shellescape(<q-args>), 1,
                        \   <bang>0 ? fzf#vim#with_preview('up:60%')
                        \           : fzf#vim#with_preview('right:50%:hidden', '?'),
                        \   <bang>0)

function! s:list_cmd()
        let base = fnamemodify(expand('%'), ':h:.:S')
        return base == '.' ? 'fd --type file --follow' : printf('fd --type file --follow | proximity-sort %s', shellescape(expand('%')))
endfunction

command! -bang -nargs=? -complete=dir Files
                        \ call fzf#vim#files(<q-args>, {'source': s:list_cmd(),
                        \                               'options': '--tiebreak=index'}, <bang>0)

" <leader><leader> toggles between buffers
nnoremap <leader><leader> <c-^>

" <leader>, shows/hides hidden characters
nnoremap <leader>, :set invlist<cr>

" <leader>q shows stats
nnoremap <leader>q g<c-g>

" Keymap for replacing up to next _ or -
noremap <leader>m ct_

" I can type :help on my own, thanks.
map <F1> <Esc>
imap <F1> <Esc>


" Move by line
nnoremap j gj
nnoremap k gk

" Open file adjustment to current file
nnoremap <leader>e :e <C-R>=expand("%:p:h") . "/" <CR>
