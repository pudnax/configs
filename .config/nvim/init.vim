let mapleader = "\<Space>"

call plug#begin()
Plug 'rust-lang/rust.vim'
Plug 'prettier/vim-prettier'
Plug 'nvim-treesitter/nvim-treesitter'

Plug 'neomake/neomake'
Plug 'tpope/vim-dispatch'

Plug 'majutsushi/tagbar'

Plug 'ryanoasis/vim-devicons'

Plug 'chriskempson/base16-vim'
Plug 'vim-airline/vim-airline' 			    " statusline
Plug 'vim-airline/vim-airline-themes'

Plug 'vim-utils/vim-man'
Plug 'mbbill/undotree'

Plug 'sheerun/vim-polyglot'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-git', {'autoload':{'filetypes':['gitcommit','gitconfig', 'gitrebase', 'gitsendmail']}}

Plug 'mattn/emmet-vim', {'autoload':{'filetypes':['html','css','sass','scss','less']}} " HTML completion

Plug 'godlygeek/tabular'
Plug 'jackguo380/vim-lsp-cxx-highlight'

Plug 'vuciv/vim-bujo'

Plug 'rhysd/clever-f.vim'
Plug 'tpope/vim-commentary'
" Tabs or 4 space highlighting
Plug 'nathanaelkane/vim-indent-guides'

" VIM enhancements
Plug 'ciaranm/securemodelines'
Plug 'editorconfig/editorconfig-vim'
Plug 'justinmk/vim-sneak'

" Rust objet notation
Plug 'ron-rs/ron.vim'

" Shaders
Plug 'tikhomirov/vim-glsl'
Plug 'beyondmarc/hlsl.vim'

" Trailing whitespaces and :FixWhitespace
Plug 'bronson/vim-trailing-whitespace'

Plug 'machakann/vim-highlightedyank'
Plug 'andymass/vim-matchup'

" Fuzzy finder
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'stsewd/fzf-checkout.vim'

Plug 'plasticboy/vim-markdown'
" Syntactic language support
Plug 'cespare/vim-toml'
Plug 'stephpy/vim-yaml'

" Multi cursor
Plug 'mg979/vim-visual-multi', {'branch': 'master'}

Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }

" Semantic language support
Plug 'neoclide/coc.nvim', {'branch': 'release'}

call plug#end()

"""""""""""""""""""""""""""""""""""""""""""""""""
" GENERAL SETTINGS
""""""""""""""""""""""""""""""""""""""""""""""""
syntax on
set autoread
set nocompatible

" enable Normal mode keys in ru layout
set langmap=ФИСВУАПРШОЛДЬТЩЗЙКЫЕГМЦЧНЯ;ABCDEFGHIJKLMNOPQRSTUVWXYZ,фисвуапршолдьтщзйкыегмцчня;abcdefghijklmnopqrstuvwxyz

" =============================================================================
" # Autocommands
" =============================================================================

" Prevent accidental writes to buffers that shouldn't be edited
autocmd BufRead *.orig set readonly
autocmd BufRead *.pacnew set readonly

" Leave paste mode when leaving insert mode
autocmd InsertLeave * set nopaste

" Jump to last edit position on opening file
if has("autocmd")
  " https://stackoverflow.com/questions/31449496/vim-ignore-specifc-file-in-autocommand
  au BufReadPost * if expand('%:p') !~# '\m/\.git/' && line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif

" Follow Rust code style rules
au Filetype rust set colorcolumn=100

" Help filetype detection
autocmd BufRead *.plot set filetype=gnuplot
autocmd BufRead *.md set filetype=markdown
autocmd BufRead *.lds set filetype=ld
autocmd BufRead *.tex set filetype=tex
autocmd BufRead *.trm set filetype=c
autocmd BufRead *.xlsx.axlsx set filetype=ruby
