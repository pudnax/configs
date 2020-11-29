" Follow Rust code style rules
autocmd Filetype rust set colorcolumn=100

autocmd Filetype rust,rs setlocal makeprg=cargo\ check\ --message-format=short

autocmd QuickFixCmdPost [^l]* nested cwindow
autocmd QuickFixCmdPost    l* nested lwindow

autocmd Filetype rust command! -bang -nargs=* Cr call TermWrapper('cargo run ' . <q-args>)
autocmd Filetype rust command! -bang -nargs=* Cc call TermWrapper('cargo check ' . <q-args>)
autocmd Filetype rust command! -bang -nargs=* Cb call TermWrapper('cargo build ' . <q-args>)
autocmd Filetype rust command! -bang -nargs=* Ct call TermWrapper('cargo test ' . <q-args>)
autocmd Filetype rust nnoremap <leader>fr :Cr<CR>
autocmd Filetype rust nnoremap <leader>fc :Cc<CR>
autocmd Filetype rust nnoremap <leader>fb :Cb<CR>
autocmd Filetype rust nnoremap <leader>ft :Ct<CR>
