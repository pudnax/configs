---  HELPERS  ---

local cmd = vim.cmd
local opt = vim.opt

---  VIM ONLY COMMANDS  ---

cmd("filetype plugin on")
cmd('let &titleold="' .. TERMINAL .. '"')
cmd("set inccommand=split")
cmd("set iskeyword+=-")

if O.transparent_window then
	cmd("au ColorScheme * hi Normal ctermbg=none guibg=none")
	cmd("au ColorScheme * hi SignColumn ctermbg=none guibg=none")
	cmd("au ColorScheme * hi NormalNC ctermbg=none guibg=none")
	cmd("au ColorScheme * hi MsgArea ctermbg=none guibg=none")
	cmd("au ColorScheme * hi TelescopeBorder ctermbg=none guibg=none")
	cmd("au ColorScheme * hi NvimTreeNormal ctermbg=none guibg=none")
	cmd("let &fcs='eob: '")
end

---  SETTINGS  ---

opt.shortmess:append("c")

for _, plugin in pairs(O.disabled_built_ins) do
	vim.g["loaded_" .. plugin] = 1
end

for k, v in pairs(O.default_options) do
	vim.opt[k] = v
end
