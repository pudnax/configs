lua << EOF
local actions = require('telescope.actions')
require('telescope').setup{
	defaults = {
		file_sorter = require'telescope.sorters'.get_fzy_sorter,
		prompt_prefix = ' >',
        color_devicons = true,

		mappings = {
			i = {
				["<esc>"] = actions.close,
			},
		},
	},
	extensions = {
        fzy_native = {
            override_generic_sorter = false,
            override_file_sorter = true,
        }
    }
}
require('telescope').load_extension('fzy_native')
local M = {}
M.git_branches = function()
    require("telescope.builtin").git_branches({
        attach_mappings = function(prompt_bufnr, map)
            map('i', '<c-d>', actions.git_delete_branch)
            map('n', '<c-d>', actions.git_delete_branch)
            return true
        end
    })
end
EOF

nnoremap <C-p> :lua require('telescope.builtin').find_files()<CR>
nnoremap <leader>s :lua require('telescope.builtin').grep_string { search = vim.fn.expand("<cword> ") }<CR>
nnoremap <leader>; :lua require('telescope.builtin').buffers()<CR>
nnoremap <leader>ps :lua require('telescope.builtin').grep_string({ search = vim.fn.input("Grep For > ")})<CR>
