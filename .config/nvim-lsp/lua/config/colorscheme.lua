local utils = require('utils')
local cmd = vim.cmd

utils.opt('o', 'termguicolors', true)
cmd 'colorscheme gruvbox-material'
-- utils.opt('o', 'gruvbox_material_better_performance', true)
vim.cmd 'let g:gruvbox_material_better_performance = 1'
