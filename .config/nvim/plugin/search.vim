""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Shortcuts
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Ctrl-c: Copy (works with system clipboard due to clipboard setting)
vnoremap <c-c> y`]

" Ctrl-r: Easier search and replace
vnoremap <c-r> "hy:%s/<c-r>h//gc<left><left><left>

" Ctrl-s: Easier substitue
vnoremap <c-s> :s/\%V//g<left><left><left>

" Ctrl-f: Find with MultipleCursors
vnoremap <c-f> :MultipleCursorsFind

let g:fzf_layout = { 'window': { 'width': 0.8, 'height': 0.8 } }
let $FZF_DEFAULT_OPTS='--reverse'
let g:fzf_branch_actions = {
      \ 'rebase': {
      \   'prompt': 'Rebase> ',
      \   'execute': 'echo system("{git} rebase {branch}")',
      \   'multiple': v:false,
      \   'keymap': 'ctrl-r',
      \   'required': ['branch'],
      \   'confirm': v:false,
      \ },
      \ 'track': {
      \   'prompt': 'Track> ',
      \   'execute': 'echo system("{git} checkout --track {branch}")',
      \   'multiple': v:false,
      \   'keymap': 'ctrl-t',
      \   'required': ['branch'],
      \   'confirm': v:false,
      \ },
      \}

" from http://sheerun.net/2014/03/21/how-to-boost-your-vim-productivity/
if executable('rg')
	let g:rg_derive_root='true'
        set grepprg=rg\ --no-heading\ --vimgrep
        set grepformat=%f:%l%c:%m
endif
if executable('ag')
	set grepprg=ag\ --nogroup\ --nocolor
endif
