local utils = require('utils')

utils.map('n', ';', ':')

utils.map('n', '<C-q>', '<Cmd>qa<CR>')

utils.map('n', 'Y', 'y$')
utils.map('i', '<C-j>', '<ESC>')

utils.map('n', '<leader>w', '<Cmd>w<CR>')

utils.map('n', '<C-l>', '<cmd>noh<CR>')
utils.map('n', '<C-h>', '<cmd>noh<CR>')

utils.map('n', '<Leader>tt', '<Cmd>15sp +term<CR>')
utils.map('n', '<C-w><C-o>', ':MaximizerToggle!<CR>')

utils.map('t', '<C-w><C-o>', '<C-\\><C-n> :MaximizerToggle!<CR>')
utils.map('t', '<C-h>', '<C-\\><C-n><C-w>h')
utils.map('t', '<C-j>', '<C-\\><C-n><C-w>j')
utils.map('t', '<C-k>', '<C-\\><C-n><C-w>k')
utils.map('t', '<C-l>', '<C-\\><C-n><C-w>l')
utils.map('t', 'jk', '<C-\\><C-n>')

utils.map('n', '<Leader>qf', '<Cmd>copen<CR>')
utils.map('n', '<Leader>qc', '<Cmd>cclose<CR>')
utils.map('n', '<Leader>qn', '<Cmd>cnext<CR>')
utils.map('n', '<Leader>qp', '<Cmd>cprev<CR>')
utils.map('n', '<Leader>qz', '<Cmd>cex []<CR>')
utils.map('n', '<Leader>qh', 'q:')
utils.map('n', '<Leader>qs', 'q/')

utils.map('v', '<leader>p', '"_dP')

utils.map('n', '<leader>tn', '<Cmd>tabnew<CR>')
utils.map('n', '<leader>to', '<Cmd>tabonly<CR>')
utils.map('n', '<leader>tc', '<Cmd>tabcloce<CR>')
utils.map('n', '<leader>tm', '<Cmd>tabmove')

utils.map('n', '<C-t>l', '<Cmd>tabr<CR>')
utils.map('n', '<C-t>h', '<Cmd>tabl<CR>')
utils.map('n', '<C-t>j', '<Cmd>tabp<CR>')
utils.map('n', '<C-t>k', '<Cmd>tabn<CR>')

-- Move by line
utils.map('n', 'j', 'gj')
utils.map('n', 'k', 'gk')

-- <leader><leader> toggles between buffers
utils.map('n', '<leader><leader>', '<C-^>')

-- <leader>, shows/hides hidden characters
utils.map('n', '<leader>,', '<Cmd>set invlist<cr>')

-- <leader>q shows stats
utils.map('n', '<leader>q', 'g<c-g>')

vim.api.nvim_exec([[

map H ^
map L $

" Ctrl-s: Easier substitue
noremap <c-s> :s/\%V//g<left><left><left>

function! TermWrapper(command) abort
    if winwidth('%') >= 160 " Minimum width
        let buffercmd = 'vnew'
    else
        let buffercmd = 'new'
    endif
    exec buffercmd
    exec 'term ' . a:command
    exec 'startinsert'
endfunction

autocmd Filetype glsl map <C-K> :pyf ~/bins/clang-format.py<cr>

" Open new file adjacent to current file
nnoremap <leader>e :e <C-R>=expand("%:p:h") . "/" <CR>

cnoreabbrev W! w!
cnoreabbrev Q! q!
cnoreabbrev Qall! qall!
cnoreabbrev Wq wq
cnoreabbrev Wa wa
cnoreabbrev wQ wq
cnoreabbrev WQ wq
cnoreabbrev W w
cnoreabbrev Q q
cnoreabbrev Qall qall

vmap < <gv
vmap > >gv

nnoremap <silent> <M-left> <C-w>>
nnoremap <silent> <M-right> <C-w><
nnoremap <silent> <M-up> <C-w>+
nnoremap <silent> <M-down> <C-w>-

nnoremap <Leader>pd :let &runtimepath.=','.escape(expand('%:p:h'), '\,')

vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv

nnoremap <Leader>es :call tts#Speak()<CR>
vnoremap <Leader>es :call tts#Speak(1)<CR>

]], false)
