function map(mode, lhs, rhs, opts)
    local options = {noremap = true, silent = true}
    if opts then options = vim.tbl_extend('force', options, opts) end
    vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

map('n', ';', ':')

map('n', '<C-s>', '<Cmd>w<CR>')

map('n', 'Y', 'y$')

map('i', '<C-j>', '<ESC>')
map('n', '<C-j>', '<ESC>')
map('i', '<C-k>', '<ESC>')
map('n', '<C-k>', '<ESC>')

-- Move current line / block with Alt-j/k a la vscode.
map('n', "<A-j>", ":m .+1<CR>==")
map('n', "<A-k>", ":m .-2<CR>==")

-- QuickFix
map('n', "]q", ":cnext<CR>")
map('n', "[q", ":cprev<CR>")
map('n', "<C-q>",":call QuickFixToggle()<CR>")

map('n', '<leader>h', '<cmd>noh<CR>')

map('v', '<leader>p', '"_dP')

-- Better indenting
map('v', "<", "<gv")
map('v', ">", ">gv")

-- Move selected line / block of text in visual mode
map('x', "K", ":move '<-2<CR>gv-gv")
map('x', "J", ":move '>+1<CR>gv-gv")

-- Move current line / block with Alt-j/k ala vscode.
map('x', "<A-j>", ":m '>+1<CR>gv-gv")
map('x', "<A-k>", ":m '<-2<CR>gv-gv")

-- <leader><leader> toggles between buffers
map('n', '<leader><leader>', '<C-^>')

-- <leader>, shows/hides hidden characters
map('n', '<leader>,', '<Cmd>set invlist<cr>')

vim.api.nvim_exec([[
map H ^
map L $

autocmd Filetype glsl,wgsl map <C-K> :pyf ~/bins/clang-format.py<cr>

" Open new file adjacent to current file
nnoremap <leader>e :e <C-R>=expand("%:p:h") . "/" <CR>
]], false)
