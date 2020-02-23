filetype indent on
let mapleader = "\<Space>"

set encoding=utf-8
set nocompatible
syntax on

call plug#begin()
Plug 'vim-airline/vim-airline'
Plug 'cespare/vim-toml'
Plug 'stephpy/vim-yaml'
Plug 'raimondi/delimitmate'
Plug 'easymotion/vim-easymotion'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-sensible'
Plug 'sheerun/vim-polyglot'
Plug 'nathanaelkane/vim-indent-guides'
Plug 'ryanoasis/vim-devicons'

" Language settings
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

" Theme
set termguicolors
set background=dark
colorscheme base16-gruvbox-dark-hard


set langmap=ФИСВУАПРШОЛДЬТЩЗЙКЫЕГМЦЧНЯ;ABCDEFGHIJKLMNOPQRSTUVWXYZ,фисвуапршолдьтщзйкыегмцчня;abcdefghijklmnopqrstuvwxyz

"wrap заставляет переносить строчки без их разделения
"Соответсвенно nowrap рендерит строчки за границами экрана
set wrap linebreak nolist "Данная вариация работает как wrap...
set textwidth=90 

set ttimeoutlen=10 "Понижаем задержку ввода escape последовательностей

" LightLine config
let g:airline_powerline_fonts = 1 "Включить поддержку Powerline шрифтов
let g:airline#extensions#keymap#enabled = 0 "Не показывать текущий маппинг
let g:airline_section_z = "\ue0a1:%l/%L Col:%c" "Кастомная графа положения курсора
let g:Powerline_symbols='unicode' "Поддержка unicode
let g:airline#extensions#xkblayout#enabled = 0 

nnoremap <leader>c :!cargo clippy

" NERD tree configuration
let g:NERDTreeShowHidden = 1
let g:NERDTreeMinimalUI = 1
let g:NERDTreeIgnore = []
let g:NERDTreeStatusline = ''
" Automaticaly close nvim if NERDTree is only thing left open
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
" Toggle
nnoremap <silent> <C-b> :NERDTreeToggle<CR>

" Markdown
let g:vim_markdown_folding_disabled=1
let g:vim_markdown_math=1

" Expand tab into spaces:
set expandtab

" Rust + 
"
" setup rust_analyzer LSP (IDE features)
lua require'nvim_lsp'.rust_analyzer.setup{}

" Use LSP omni-completion in Rust files
autocmd Filetype rust setlocal omnifunc=v:lua.vim.lsp.omnifunc

" rustfmt on write using autoformat
"autocmd BufWrite * :Autoformat
"TODO: clippy on write
"autocmd BufWrite * :Autoformat



"=============================================================================
" # Editor settings
"=============================================================================
filetype plugin indent on
set timeoutlen=300 " http://stackoverflow.com/questions/2158516/delay-before-o-opens-a-new-line

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
set cmdheight=2
set encoding=UTF-8
" Open hotkeys
map <C-p> :Files<CR>
nmap <leader>; :Buffers<CR>

" Quick-save
nmap <leader>w :w<CR>

" FZF open
" nnoremap <C-p> :FZF<CR
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
set shortmess+=c " don't give |ins-completion-menu| messages.

" Show those damn hidden characters
" Verbose: set listchars=nbsp:¬,eol:¶,extends:»,precedes:«,trail:•
set listchars=nbsp:¬,extends:»,precedes:«,trail:*

"=============================================================================
" # Keyboard shortcuts
""=============================================================
" ; as :
nnoremap ; :

" Move by line
nnoremap j gj
nnoremap k gk

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

" Open new file adjacent to current file
nnoremap <leader>e :e <C-R>=expand("%:p:h") . "/" <CR>

