-- Automatically generated packer.nvim plugin loader code

if vim.api.nvim_call_function('has', {'nvim-0.5'}) ~= 1 then
  vim.api.nvim_command('echohl WarningMsg | echom "Invalid Neovim version for packer.nvim! | echohl None"')
  return
end

vim.api.nvim_command('packadd packer.nvim')

local no_errors, error_msg = pcall(function()

  local time
  local profile_info
  local should_profile = false
  if should_profile then
    local hrtime = vim.loop.hrtime
    profile_info = {}
    time = function(chunk, start)
      if start then
        profile_info[chunk] = hrtime()
      else
        profile_info[chunk] = (hrtime() - profile_info[chunk]) / 1e6
      end
    end
  else
    time = function(chunk, start) end
  end
  
local function save_profiles(threshold)
  local sorted_times = {}
  for chunk_name, time_taken in pairs(profile_info) do
    sorted_times[#sorted_times + 1] = {chunk_name, time_taken}
  end
  table.sort(sorted_times, function(a, b) return a[2] > b[2] end)
  local results = {}
  for i, elem in ipairs(sorted_times) do
    if not threshold or threshold and elem[2] > threshold then
      results[i] = elem[1] .. ' took ' .. elem[2] .. 'ms'
    end
  end

  _G._packer = _G._packer or {}
  _G._packer.profile_output = results
end

time([[Luarocks path setup]], true)
local package_path_str = "/home/pudi3/.cache/nvim/packer_hererocks/2.0.5/share/lua/5.1/?.lua;/home/pudi3/.cache/nvim/packer_hererocks/2.0.5/share/lua/5.1/?/init.lua;/home/pudi3/.cache/nvim/packer_hererocks/2.0.5/lib/luarocks/rocks-5.1/?.lua;/home/pudi3/.cache/nvim/packer_hererocks/2.0.5/lib/luarocks/rocks-5.1/?/init.lua"
local install_cpath_pattern = "/home/pudi3/.cache/nvim/packer_hererocks/2.0.5/lib/lua/5.1/?.so"
if not string.find(package.path, package_path_str, 1, true) then
  package.path = package.path .. ';' .. package_path_str
end

if not string.find(package.cpath, install_cpath_pattern, 1, true) then
  package.cpath = package.cpath .. ';' .. install_cpath_pattern
end

time([[Luarocks path setup]], false)
time([[try_loadstring definition]], true)
local function try_loadstring(s, component, name)
  local success, result = pcall(loadstring(s))
  if not success then
    vim.schedule(function()
      vim.api.nvim_notify('packer.nvim: Error running ' .. component .. ' for ' .. name .. ': ' .. result, vim.log.levels.ERROR, {})
    end)
  end
  return result
end

time([[try_loadstring definition]], false)
time([[Defining packer_plugins]], true)
_G.packer_plugins = {
  LuaSnip = {
    loaded = true,
    path = "/home/pudi3/.local/share/nvim/site/pack/packer/start/LuaSnip"
  },
  ["clever-f.vim"] = {
    loaded = true,
    path = "/home/pudi3/.local/share/nvim/site/pack/packer/start/clever-f.vim"
  },
  ["cmp-buffer"] = {
    loaded = true,
    path = "/home/pudi3/.local/share/nvim/site/pack/packer/start/cmp-buffer"
  },
  ["cmp-calc"] = {
    loaded = true,
    path = "/home/pudi3/.local/share/nvim/site/pack/packer/start/cmp-calc"
  },
  ["cmp-latex-symbols"] = {
    loaded = true,
    path = "/home/pudi3/.local/share/nvim/site/pack/packer/start/cmp-latex-symbols"
  },
  ["cmp-nvim-lsp"] = {
    loaded = true,
    path = "/home/pudi3/.local/share/nvim/site/pack/packer/start/cmp-nvim-lsp"
  },
  ["cmp-nvim-lua"] = {
    loaded = true,
    path = "/home/pudi3/.local/share/nvim/site/pack/packer/start/cmp-nvim-lua"
  },
  ["cmp-path"] = {
    loaded = true,
    path = "/home/pudi3/.local/share/nvim/site/pack/packer/start/cmp-path"
  },
  cmp_luasnip = {
    loaded = true,
    path = "/home/pudi3/.local/share/nvim/site/pack/packer/start/cmp_luasnip"
  },
  ["codi.vim"] = {
    commands = { "Codi" },
    loaded = false,
    needs_bufread = false,
    path = "/home/pudi3/.local/share/nvim/site/pack/packer/opt/codi.vim"
  },
  ["crates.nvim"] = {
    after_files = { "/home/pudi3/.local/share/nvim/site/pack/packer/opt/crates.nvim/after/plugin/cmp_crates.lua" },
    config = { "\27LJ\1\0024\0\0\2\0\3\0\0064\0\0\0%\1\1\0>\0\2\0027\0\2\0>\0\1\1G\0\1\0\nsetup\vcrates\frequire\0" },
    loaded = false,
    needs_bufread = false,
    path = "/home/pudi3/.local/share/nvim/site/pack/packer/opt/crates.nvim"
  },
  ["dial.nvim"] = {
    config = { "\27LJ\1\2ı\4\0\0\5\0\20\0&4\0\0\0%\1\1\0>\0\2\0024\1\2\0007\1\3\1%\2\4\0>\1\2\0017\1\5\0007\2\a\0007\2\b\0023\3\t\0003\4\n\0:\4\v\3>\2\2\2:\2\6\0014\1\f\0007\1\r\0017\2\14\0007\2\15\0027\2\16\2%\3\6\0>\1\3\0017\1\5\0007\2\a\0007\2\b\0023\3\18\0003\4\19\0:\4\v\3>\2\2\2:\2\17\0014\1\f\0007\1\r\0017\2\14\0007\2\15\0027\2\16\2%\3\17\0>\1\3\1G\0\1\0\1\3\0\0\tTrue\nFalse\1\0\1\tname\fBoolean\19custom#Boolean\vnormal\15searchlist\vconfig\vinsert\ntable\fstrlist\1\3\0\0\ttrue\nfalse\1\0\1\tname\fboolean\16enum_cyclic\vcommon\19custom#boolean\faugendsü\2\t\t      nmap <C-a> <Plug>(dial-increment)\n\t\t      nmap <C-x> <Plug>(dial-decrement)\n\t\t      vmap <C-a> <Plug>(dial-increment)\n\t\t      vmap <C-x> <Plug>(dial-decrement)\n\t\t      vmap g<C-a> <Plug>(dial-increment-additional)\n\t\t      vmap g<C-x> <Plug>(dial-decrement-additional)\n\t\t    \bcmd\bvim\tdial\frequire\0" },
    loaded = false,
    needs_bufread = false,
    path = "/home/pudi3/.local/share/nvim/site/pack/packer/opt/dial.nvim"
  },
  ["formatter.nvim"] = {
    config = { "\27LJ\1\2™\2\0\0\3\0\a\0\f4\0\0\0%\1\1\0>\0\2\0027\0\2\0>\0\1\0014\0\3\0007\0\4\0007\0\5\0%\1\6\0)\2\2\0>\0\3\1G\0\1\0«\1                augroup FormatAutogroup\n                  autocmd!\n                  autocmd BufWritePost *.js,*.lua,*.c,*.cpp,*.h,*.hpp, FormatWrite\n                augroup END\n                \14nvim_exec\bapi\bvim\nsetup\19core.formatter\frequire\0" },
    loaded = true,
    path = "/home/pudi3/.local/share/nvim/site/pack/packer/start/formatter.nvim"
  },
  ["friendly-snippets"] = {
    loaded = true,
    path = "/home/pudi3/.local/share/nvim/site/pack/packer/start/friendly-snippets"
  },
  ["gitsigns.nvim"] = {
    config = { "\27LJ\1\2Ø\2\0\0\4\0\16\0\0194\0\0\0%\1\1\0>\0\2\0027\0\2\0003\1\14\0003\2\4\0003\3\3\0:\3\5\0023\3\6\0:\3\a\0023\3\b\0:\3\t\0023\3\n\0:\3\v\0023\3\f\0:\3\r\2:\2\15\1>\0\2\1G\0\1\0\nsigns\1\0\0\17changedelete\1\0\2\ttext\6~\ahl\20GitGutterChange\14topdelete\1\0\2\ttext\b‚Äæ\ahl\20GitGutterDelete\vdelete\1\0\2\ttext\6_\ahl\20GitGutterDelete\vchange\1\0\2\ttext\6~\ahl\20GitGutterChange\badd\1\0\0\1\0\2\ttext\6+\ahl\17GitGutterAdd\nsetup\rgitsigns\frequire\0" },
    loaded = true,
    path = "/home/pudi3/.local/share/nvim/site/pack/packer/start/gitsigns.nvim"
  },
  ["glow.nvim"] = {
    loaded = false,
    needs_bufread = false,
    path = "/home/pudi3/.local/share/nvim/site/pack/packer/opt/glow.nvim"
  },
  ["goto-preview"] = {
    config = { "\27LJ\1\2í\3\0\0\4\0\t\1\0224\0\0\0%\1\1\0>\0\2\0027\0\2\0003\1\3\0004\2\4\0007\2\5\2%\3\6\0>\2\2\2;\2\1\0014\2\4\0007\2\5\2%\3\a\0>\2\2\2;\2\2\0014\2\4\0007\2\5\2%\3\b\0>\2\2\0<\2\0\0>\0\2\1G\0\1\0Ennoremap gP <cmd>lua require('goto-preview').close_all_win()<CR>Tnnoremap gpi <cmd>lua require('goto-preview').goto_preview_implementation()<CR>Pnnoremap gpd <cmd>lua require('goto-preview').goto_preview_definition()<CR>\bcmd\bvim\1\0\4\vheight\3\25\ndebug\1\21default_mappings\1\nwidth\3x\nsetup\17goto-preview\frequire\aÄÄ¿ô\4\0" },
    loaded = true,
    path = "/home/pudi3/.local/share/nvim/site/pack/packer/start/goto-preview"
  },
  ["hop.nvim"] = {
    config = { "\27LJ\1\2¿\1\0\0\5\0\r\0\0224\0\0\0%\1\1\0>\0\2\0027\0\2\0>\0\1\0014\0\3\0007\0\4\0007\0\5\0%\1\6\0%\2\a\0%\3\b\0003\4\t\0>\0\5\0014\0\3\0007\0\4\0007\0\5\0%\1\6\0%\2\n\0%\3\v\0003\4\f\0>\0\5\1G\0\1\0\1\0\1\vsilent\2\17:HopWord<cr>\6S\1\0\1\vsilent\2\18:HopChar2<cr>\6s\6n\20nvim_set_keymap\bapi\bvim\nsetup\bhop\frequire\0" },
    loaded = false,
    needs_bufread = false,
    path = "/home/pudi3/.local/share/nvim/site/pack/packer/opt/hop.nvim"
  },
  ["indent-blankline.nvim"] = {
    loaded = false,
    needs_bufread = false,
    path = "/home/pudi3/.local/share/nvim/site/pack/packer/opt/indent-blankline.nvim"
  },
  ["lsp_signature.nvim"] = {
    config = { "\27LJ\1\2;\0\0\2\0\3\0\0064\0\0\0%\1\1\0>\0\2\0027\0\2\0>\0\1\1G\0\1\0\nsetup\18lsp_signature\frequire\0" },
    loaded = false,
    needs_bufread = false,
    path = "/home/pudi3/.local/share/nvim/site/pack/packer/opt/lsp_signature.nvim"
  },
  ["neuron.nvim"] = {
    loaded = true,
    path = "/home/pudi3/.local/share/nvim/site/pack/packer/start/neuron.nvim"
  },
  ["nord-vim"] = {
    loaded = true,
    path = "/home/pudi3/.local/share/nvim/site/pack/packer/start/nord-vim"
  },
  ["numb.nvim"] = {
    config = { "\27LJ\1\2X\0\0\2\0\4\0\a4\0\0\0%\1\1\0>\0\2\0027\0\2\0003\1\3\0>\0\2\1G\0\1\0\1\0\2\17show_numbers\2\20show_cursorline\2\nsetup\tnumb\frequire\0" },
    loaded = false,
    needs_bufread = false,
    path = "/home/pudi3/.local/share/nvim/site/pack/packer/opt/numb.nvim"
  },
  ["nvim-autopairs"] = {
    config = { "\27LJ\1\2@\0\0\2\0\3\0\a4\0\0\0%\1\1\0>\0\2\0027\0\2\0002\1\0\0>\0\2\1G\0\1\0\nsetup\19nvim-autopairs\frequire\0" },
    loaded = true,
    path = "/home/pudi3/.local/share/nvim/site/pack/packer/start/nvim-autopairs"
  },
  ["nvim-bqf"] = {
    config = { "\27LJ\1\2ı\2\0\0\5\0\18\0\0214\0\0\0%\1\1\0>\0\2\0027\0\2\0003\1\3\0003\2\4\0003\3\5\0:\3\6\2:\2\a\0013\2\b\0:\2\t\0013\2\15\0003\3\v\0003\4\n\0:\4\f\0033\4\r\0:\4\14\3:\3\16\2:\2\17\1>\0\2\1G\0\1\0\vfilter\bfzf\1\0\0\15extra_opts\1\5\0\0\v--bind\22ctrl-o:toggle-all\r--prompt\a> \15action_for\1\0\0\1\0\1\vctrl-s\nsplit\rfunc_map\1\0\3\vvsplit\5\14stoggleup\5\16ptogglemode\az,\fpreview\17border_chars\1\n\0\0\b‚îÉ\b‚îÉ\b‚îÅ\b‚îÅ\b‚îè\b‚îì\b‚îó\b‚îõ\b‚ñà\1\0\3\16win_vheight\3\f\15win_height\3\f\17delay_syntax\3P\1\0\1\16auto_enable\2\nsetup\bbqf\frequire\0" },
    loaded = false,
    needs_bufread = true,
    path = "/home/pudi3/.local/share/nvim/site/pack/packer/opt/nvim-bqf"
  },
  ["nvim-cmp"] = {
    config = { '\27LJ\1\2∫\1\0\0\3\0\a\0\0144\0\0\0%\1\1\0>\0\2\0027\0\2\0>\0\1\0014\0\0\0%\1\3\0>\0\2\0027\0\2\0003\1\4\0003\2\5\0:\2\6\1>\0\2\1G\0\1\0\rmap_char\1\0\2\ball\6(\btex\6{\1\0\4\vinsert\1\17map_complete\2\16auto_select\2\vmap_cr\2"nvim-autopairs.completion.cmp\nsetup\rcore.cmp\frequire\0' },
    loaded = true,
    path = "/home/pudi3/.local/share/nvim/site/pack/packer/start/nvim-cmp"
  },
  ["nvim-lastplace"] = {
    config = { "\27LJ\1\2⁄\1\0\0\3\0\b\0\v4\0\0\0%\1\1\0>\0\2\0027\0\2\0003\1\4\0003\2\3\0:\2\5\0013\2\6\0:\2\a\1>\0\2\1G\0\1\0\30lastplace_ignore_filetype\1\5\0\0\14gitcommit\14gitrebase\bsvn\rhgcommit\29lastplace_ignore_buftype\1\0\1\25lastplace_open_folds\2\1\4\0\0\rquickfix\vnofile\thelp\nsetup\19nvim-lastplace\frequire\0" },
    loaded = false,
    needs_bufread = false,
    path = "/home/pudi3/.local/share/nvim/site/pack/packer/opt/nvim-lastplace"
  },
  ["nvim-lsp-installer"] = {
    loaded = true,
    path = "/home/pudi3/.local/share/nvim/site/pack/packer/start/nvim-lsp-installer"
  },
  ["nvim-lspconfig"] = {
    loaded = true,
    path = "/home/pudi3/.local/share/nvim/site/pack/packer/start/nvim-lspconfig"
  },
  ["nvim-reload"] = {
    loaded = true,
    path = "/home/pudi3/.local/share/nvim/site/pack/packer/start/nvim-reload"
  },
  ["nvim-spectre"] = {
    config = { "\27LJ\1\0025\0\0\2\0\3\0\0064\0\0\0%\1\1\0>\0\2\0027\0\2\0>\0\1\1G\0\1\0\nsetup\fspectre\frequire\0" },
    loaded = false,
    needs_bufread = false,
    path = "/home/pudi3/.local/share/nvim/site/pack/packer/opt/nvim-spectre"
  },
  ["nvim-tree.lua"] = {
    config = { "\27LJ\1\2<\0\0\2\0\3\0\0064\0\0\0%\1\1\0>\0\2\0027\0\2\0>\0\1\1G\0\1\0\nsetup\19core.nvim-tree\frequire\0" },
    loaded = true,
    path = "/home/pudi3/.local/share/nvim/site/pack/packer/start/nvim-tree.lua"
  },
  ["nvim-treesitter"] = {
    config = { "\27LJ\1\2é\1\0\0\5\0\b\0\0154\0\0\0%\1\1\0>\0\2\0027\0\2\0>\0\1\0014\0\0\0%\1\3\0>\0\2\0027\0\4\0\16\1\0\0%\2\5\0%\3\6\0%\4\a\0>\1\4\1G\0\1\0\28<cmd>NvimTreeToggle<CR>\14<leader>e\6n\bmap\tutil\nsetup\20core.treesitter\frequire\0" },
    loaded = true,
    path = "/home/pudi3/.local/share/nvim/site/pack/packer/start/nvim-treesitter"
  },
  ["nvim-treesitter-textobjects"] = {
    loaded = true,
    path = "/home/pudi3/.local/share/nvim/site/pack/packer/start/nvim-treesitter-textobjects"
  },
  ["nvim-web-devicons"] = {
    loaded = true,
    path = "/home/pudi3/.local/share/nvim/site/pack/packer/start/nvim-web-devicons"
  },
  ["packer.nvim"] = {
    loaded = true,
    path = "/home/pudi3/.local/share/nvim/site/pack/packer/start/packer.nvim"
  },
  ["plenary.nvim"] = {
    loaded = true,
    path = "/home/pudi3/.local/share/nvim/site/pack/packer/start/plenary.nvim"
  },
  ["popup.nvim"] = {
    loaded = true,
    path = "/home/pudi3/.local/share/nvim/site/pack/packer/start/popup.nvim"
  },
  rnvimr = {
    commands = { "RnvimrToggle" },
    config = { "\27LJ\1\2x\0\0\2\0\5\0\r4\0\0\0007\0\1\0'\1\1\0:\1\2\0004\0\0\0007\0\1\0'\1\1\0:\1\3\0004\0\0\0007\0\1\0'\1\1\0:\1\4\0G\0\1\0\21rnvimr_bw_enable\23rnvimr_pick_enable\23rnvimr_draw_border\6g\bvim\0" },
    loaded = false,
    needs_bufread = false,
    path = "/home/pudi3/.local/share/nvim/site/pack/packer/opt/rnvimr"
  },
  ["ron.vim"] = {
    loaded = true,
    path = "/home/pudi3/.local/share/nvim/site/pack/packer/start/ron.vim"
  },
  ["rust-tools.nvim"] = {
    config = { "\27LJ\1\2=\0\0\2\0\3\0\0064\0\0\0%\1\1\0>\0\2\0027\0\2\0>\0\1\1G\0\1\0\nsetup\20core.rust-tools\frequire\0" },
    loaded = false,
    needs_bufread = true,
    path = "/home/pudi3/.local/share/nvim/site/pack/packer/opt/rust-tools.nvim"
  },
  ["sql.nvim"] = {
    loaded = true,
    path = "/home/pudi3/.local/share/nvim/site/pack/packer/start/sql.nvim"
  },
  ["symbols-outline.nvim"] = {
    config = { "\27LJ\1\2û\1\0\0\5\0\n\0\0144\0\0\0007\0\1\0003\1\3\0:\1\2\0004\0\4\0%\1\5\0>\0\2\0027\0\6\0\16\1\0\0%\2\a\0%\3\b\0%\4\t\0>\1\4\1G\0\1\0\28<cmd>SymbolsOutline<CR>\t<F8>\6n\bmap\tutil\frequire\1\0\2\nwidth\3\15\17auto_preview\1\20symbols_outline\6g\bvim\0" },
    loaded = true,
    path = "/home/pudi3/.local/share/nvim/site/pack/packer/start/symbols-outline.nvim"
  },
  ["telescope-frecency.nvim"] = {
    config = { "\27LJ\1\2M\0\0\2\0\4\0\a4\0\0\0%\1\1\0>\0\2\0027\0\2\0%\1\3\0>\0\2\1G\0\1\0\rfrecency\19load_extension\14telescope\frequire\0" },
    loaded = true,
    path = "/home/pudi3/.local/share/nvim/site/pack/packer/start/telescope-frecency.nvim"
  },
  ["telescope-fzf-native.nvim"] = {
    loaded = true,
    path = "/home/pudi3/.local/share/nvim/site/pack/packer/start/telescope-fzf-native.nvim"
  },
  ["telescope-github.nvim"] = {
    loaded = true,
    path = "/home/pudi3/.local/share/nvim/site/pack/packer/start/telescope-github.nvim"
  },
  ["telescope-media-files.nvim"] = {
    loaded = true,
    path = "/home/pudi3/.local/share/nvim/site/pack/packer/start/telescope-media-files.nvim"
  },
  ["telescope-symbols.nvim"] = {
    loaded = true,
    path = "/home/pudi3/.local/share/nvim/site/pack/packer/start/telescope-symbols.nvim"
  },
  ["telescope.nvim"] = {
    config = { '\27LJ\1\2‘\2\0\0\5\0\f\0\0254\0\0\0%\1\1\0>\0\2\0027\0\2\0\16\1\0\0%\2\3\0%\3\4\0%\4\5\0>\1\4\1\16\1\0\0%\2\3\0%\3\6\0%\4\a\0>\1\4\1\16\1\0\0%\2\3\0%\3\b\0%\4\t\0>\1\4\0014\1\0\0%\2\n\0>\1\2\0027\1\v\1>\1\1\1G\0\1\0\nsetup\19core.telescope:<cmd>lua require("telescope.builtin").live_grep()<CR>\15<leader>fg<<cmd>lua require("telescope.builtin").grep_string()<CR>\15<leader>ff;<cmd>lua require("telescope.builtin").find_files()<CR>\n<C-p>\6n\bmap\tutil\frequire\0' },
    loaded = true,
    path = "/home/pudi3/.local/share/nvim/site/pack/packer/start/telescope.nvim"
  },
  ["toggleterm.nvim"] = {
    config = { "\27LJ\1\2;\0\0\2\0\3\0\0064\0\0\0%\1\1\0>\0\2\0027\0\2\0>\0\1\1G\0\1\0\nsetup\18core.terminal\frequire\0" },
    loaded = false,
    needs_bufread = false,
    path = "/home/pudi3/.local/share/nvim/site/pack/packer/opt/toggleterm.nvim"
  },
  ["trouble.nvim"] = {
    commands = { "TroubleToggle" },
    config = { "\27LJ\1\2´\3\0\0\5\0\16\0#4\0\0\0%\1\1\0>\0\2\0027\0\2\0\16\1\0\0%\2\3\0%\3\4\0%\4\5\0>\1\4\1\16\1\0\0%\2\3\0%\3\6\0%\4\a\0>\1\4\1\16\1\0\0%\2\3\0%\3\b\0%\4\t\0>\1\4\1\16\1\0\0%\2\3\0%\3\n\0%\4\v\0>\1\4\1\16\1\0\0%\2\3\0%\3\f\0%\4\r\0>\1\4\1\16\1\0\0%\2\3\0%\3\14\0%\4\15\0>\1\4\1G\0\1\0/<cmd>Trouble lsp_workspace_diagnostics<cr>\14<leader>w\29<cmd>Trouble loclist<cr>\14<leader>l\30<cmd>Trouble quickfix<cr>\14<leader>q.<cmd>Trouble lsp_document_diagnostics<cr>\14<leader>d%<cmd>Trouble lsp_definitions<cr>\14<leader>f$<cmd>Trouble lsp_references<cr>\14<leader>r\6n\bmap\tutil\frequire\0" },
    loaded = false,
    needs_bufread = false,
    path = "/home/pudi3/.local/share/nvim/site/pack/packer/opt/trouble.nvim"
  },
  ["vim-commentary"] = {
    loaded = true,
    path = "/home/pudi3/.local/share/nvim/site/pack/packer/start/vim-commentary"
  },
  ["vim-fugitive"] = {
    commands = { "G", "Git", "Gdiffsplit", "Gread", "Gwrite", "Ggrep", "GMove", "GDelete", "GBrowse", "GRemove", "GRename", "Glgrep", "Gedit" },
    config = { "\27LJ\1\2ñ\1\0\0\5\0\b\0\0154\0\0\0%\1\1\0>\0\2\0027\0\2\0\16\1\0\0%\2\3\0%\3\4\0%\4\5\0>\1\4\1\16\1\0\0%\2\3\0%\3\6\0%\4\a\0>\1\4\1G\0\1\0\25<cmd>diffget //2<CR>\15<leader>gf\25<cmd>diffget //3<CR>\15<leader>gh\6n\bmap\tutil\frequire\0" },
    loaded = false,
    needs_bufread = true,
    path = "/home/pudi3/.local/share/nvim/site/pack/packer/opt/vim-fugitive"
  },
  ["vim-glsl"] = {
    loaded = true,
    path = "/home/pudi3/.local/share/nvim/site/pack/packer/start/vim-glsl"
  },
  ["vim-matchup"] = {
    after_files = { "/home/pudi3/.local/share/nvim/site/pack/packer/opt/vim-matchup/after/plugin/matchit.vim" },
    config = { "\27LJ\1\2N\0\0\2\0\4\0\0054\0\0\0007\0\1\0003\1\3\0:\1\2\0G\0\1\0\1\0\1\vmethod\npopup!matchup_matchparen_offscreen\6g\bvim\0" },
    loaded = false,
    needs_bufread = true,
    path = "/home/pudi3/.local/share/nvim/site/pack/packer/opt/vim-matchup"
  },
  ["vim-trailing-whitespace"] = {
    loaded = true,
    path = "/home/pudi3/.local/share/nvim/site/pack/packer/start/vim-trailing-whitespace"
  },
  ["vista.vim"] = {
    loaded = true,
    path = "/home/pudi3/.local/share/nvim/site/pack/packer/start/vista.vim"
  },
  ["webapi-vim"] = {
    loaded = true,
    path = "/home/pudi3/.local/share/nvim/site/pack/packer/start/webapi-vim"
  },
  ["wgsl.vim"] = {
    loaded = true,
    path = "/home/pudi3/.local/share/nvim/site/pack/packer/start/wgsl.vim"
  }
}

time([[Defining packer_plugins]], false)
-- Setup for: indent-blankline.nvim
time([[Setup for indent-blankline.nvim]], true)
try_loadstring("\27LJ\1\2„\2\0\0\2\0\v\0\0254\0\0\0007\0\1\0'\1\1\0:\1\2\0004\0\0\0007\0\1\0%\1\4\0:\1\3\0004\0\0\0007\0\1\0003\1\6\0:\1\5\0004\0\0\0007\0\1\0003\1\b\0:\1\a\0004\0\0\0007\0\1\0)\1\1\0:\1\t\0004\0\0\0007\0\1\0)\1\1\0:\1\n\0G\0\1\0-indent_blankline_show_first_indent_level4indent_blankline_show_trailing_blankline_indent\1\2\0\0\rterminal%indent_blankline_buftype_exclude\1\4\0\0\thelp\rterminal\14dashboard&indent_blankline_filetype_exclude\b‚ñè\26indent_blankline_char\23indentLine_enabled\6g\bvim\0", "setup", "indent-blankline.nvim")
time([[Setup for indent-blankline.nvim]], false)
-- Config for: formatter.nvim
time([[Config for formatter.nvim]], true)
try_loadstring("\27LJ\1\2™\2\0\0\3\0\a\0\f4\0\0\0%\1\1\0>\0\2\0027\0\2\0>\0\1\0014\0\3\0007\0\4\0007\0\5\0%\1\6\0)\2\2\0>\0\3\1G\0\1\0«\1                augroup FormatAutogroup\n                  autocmd!\n                  autocmd BufWritePost *.js,*.lua,*.c,*.cpp,*.h,*.hpp, FormatWrite\n                augroup END\n                \14nvim_exec\bapi\bvim\nsetup\19core.formatter\frequire\0", "config", "formatter.nvim")
time([[Config for formatter.nvim]], false)
-- Config for: nvim-treesitter
time([[Config for nvim-treesitter]], true)
try_loadstring("\27LJ\1\2é\1\0\0\5\0\b\0\0154\0\0\0%\1\1\0>\0\2\0027\0\2\0>\0\1\0014\0\0\0%\1\3\0>\0\2\0027\0\4\0\16\1\0\0%\2\5\0%\3\6\0%\4\a\0>\1\4\1G\0\1\0\28<cmd>NvimTreeToggle<CR>\14<leader>e\6n\bmap\tutil\nsetup\20core.treesitter\frequire\0", "config", "nvim-treesitter")
time([[Config for nvim-treesitter]], false)
-- Config for: nvim-cmp
time([[Config for nvim-cmp]], true)
try_loadstring('\27LJ\1\2∫\1\0\0\3\0\a\0\0144\0\0\0%\1\1\0>\0\2\0027\0\2\0>\0\1\0014\0\0\0%\1\3\0>\0\2\0027\0\2\0003\1\4\0003\2\5\0:\2\6\1>\0\2\1G\0\1\0\rmap_char\1\0\2\ball\6(\btex\6{\1\0\4\vinsert\1\17map_complete\2\16auto_select\2\vmap_cr\2"nvim-autopairs.completion.cmp\nsetup\rcore.cmp\frequire\0', "config", "nvim-cmp")
time([[Config for nvim-cmp]], false)
-- Config for: nvim-tree.lua
time([[Config for nvim-tree.lua]], true)
try_loadstring("\27LJ\1\2<\0\0\2\0\3\0\0064\0\0\0%\1\1\0>\0\2\0027\0\2\0>\0\1\1G\0\1\0\nsetup\19core.nvim-tree\frequire\0", "config", "nvim-tree.lua")
time([[Config for nvim-tree.lua]], false)
-- Config for: goto-preview
time([[Config for goto-preview]], true)
try_loadstring("\27LJ\1\2í\3\0\0\4\0\t\1\0224\0\0\0%\1\1\0>\0\2\0027\0\2\0003\1\3\0004\2\4\0007\2\5\2%\3\6\0>\2\2\2;\2\1\0014\2\4\0007\2\5\2%\3\a\0>\2\2\2;\2\2\0014\2\4\0007\2\5\2%\3\b\0>\2\2\0<\2\0\0>\0\2\1G\0\1\0Ennoremap gP <cmd>lua require('goto-preview').close_all_win()<CR>Tnnoremap gpi <cmd>lua require('goto-preview').goto_preview_implementation()<CR>Pnnoremap gpd <cmd>lua require('goto-preview').goto_preview_definition()<CR>\bcmd\bvim\1\0\4\vheight\3\25\ndebug\1\21default_mappings\1\nwidth\3x\nsetup\17goto-preview\frequire\aÄÄ¿ô\4\0", "config", "goto-preview")
time([[Config for goto-preview]], false)
-- Config for: gitsigns.nvim
time([[Config for gitsigns.nvim]], true)
try_loadstring("\27LJ\1\2Ø\2\0\0\4\0\16\0\0194\0\0\0%\1\1\0>\0\2\0027\0\2\0003\1\14\0003\2\4\0003\3\3\0:\3\5\0023\3\6\0:\3\a\0023\3\b\0:\3\t\0023\3\n\0:\3\v\0023\3\f\0:\3\r\2:\2\15\1>\0\2\1G\0\1\0\nsigns\1\0\0\17changedelete\1\0\2\ttext\6~\ahl\20GitGutterChange\14topdelete\1\0\2\ttext\b‚Äæ\ahl\20GitGutterDelete\vdelete\1\0\2\ttext\6_\ahl\20GitGutterDelete\vchange\1\0\2\ttext\6~\ahl\20GitGutterChange\badd\1\0\0\1\0\2\ttext\6+\ahl\17GitGutterAdd\nsetup\rgitsigns\frequire\0", "config", "gitsigns.nvim")
time([[Config for gitsigns.nvim]], false)
-- Config for: telescope.nvim
time([[Config for telescope.nvim]], true)
try_loadstring('\27LJ\1\2‘\2\0\0\5\0\f\0\0254\0\0\0%\1\1\0>\0\2\0027\0\2\0\16\1\0\0%\2\3\0%\3\4\0%\4\5\0>\1\4\1\16\1\0\0%\2\3\0%\3\6\0%\4\a\0>\1\4\1\16\1\0\0%\2\3\0%\3\b\0%\4\t\0>\1\4\0014\1\0\0%\2\n\0>\1\2\0027\1\v\1>\1\1\1G\0\1\0\nsetup\19core.telescope:<cmd>lua require("telescope.builtin").live_grep()<CR>\15<leader>fg<<cmd>lua require("telescope.builtin").grep_string()<CR>\15<leader>ff;<cmd>lua require("telescope.builtin").find_files()<CR>\n<C-p>\6n\bmap\tutil\frequire\0', "config", "telescope.nvim")
time([[Config for telescope.nvim]], false)
-- Config for: symbols-outline.nvim
time([[Config for symbols-outline.nvim]], true)
try_loadstring("\27LJ\1\2û\1\0\0\5\0\n\0\0144\0\0\0007\0\1\0003\1\3\0:\1\2\0004\0\4\0%\1\5\0>\0\2\0027\0\6\0\16\1\0\0%\2\a\0%\3\b\0%\4\t\0>\1\4\1G\0\1\0\28<cmd>SymbolsOutline<CR>\t<F8>\6n\bmap\tutil\frequire\1\0\2\nwidth\3\15\17auto_preview\1\20symbols_outline\6g\bvim\0", "config", "symbols-outline.nvim")
time([[Config for symbols-outline.nvim]], false)
-- Config for: nvim-autopairs
time([[Config for nvim-autopairs]], true)
try_loadstring("\27LJ\1\2@\0\0\2\0\3\0\a4\0\0\0%\1\1\0>\0\2\0027\0\2\0002\1\0\0>\0\2\1G\0\1\0\nsetup\19nvim-autopairs\frequire\0", "config", "nvim-autopairs")
time([[Config for nvim-autopairs]], false)
-- Config for: telescope-frecency.nvim
time([[Config for telescope-frecency.nvim]], true)
try_loadstring("\27LJ\1\2M\0\0\2\0\4\0\a4\0\0\0%\1\1\0>\0\2\0027\0\2\0%\1\3\0>\0\2\1G\0\1\0\rfrecency\19load_extension\14telescope\frequire\0", "config", "telescope-frecency.nvim")
time([[Config for telescope-frecency.nvim]], false)

-- Command lazy-loads
time([[Defining lazy-load commands]], true)
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file Gedit lua require("packer.load")({'vim-fugitive'}, { cmd = "Gedit", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file GBrowse lua require("packer.load")({'vim-fugitive'}, { cmd = "GBrowse", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file RnvimrToggle lua require("packer.load")({'rnvimr'}, { cmd = "RnvimrToggle", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file Gwrite lua require("packer.load")({'vim-fugitive'}, { cmd = "Gwrite", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file Glgrep lua require("packer.load")({'vim-fugitive'}, { cmd = "Glgrep", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file Codi lua require("packer.load")({'codi.vim'}, { cmd = "Codi", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file Gread lua require("packer.load")({'vim-fugitive'}, { cmd = "Gread", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file GRename lua require("packer.load")({'vim-fugitive'}, { cmd = "GRename", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file GRemove lua require("packer.load")({'vim-fugitive'}, { cmd = "GRemove", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file GDelete lua require("packer.load")({'vim-fugitive'}, { cmd = "GDelete", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file TroubleToggle lua require("packer.load")({'trouble.nvim'}, { cmd = "TroubleToggle", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file Gdiffsplit lua require("packer.load")({'vim-fugitive'}, { cmd = "Gdiffsplit", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file Ggrep lua require("packer.load")({'vim-fugitive'}, { cmd = "Ggrep", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file Git lua require("packer.load")({'vim-fugitive'}, { cmd = "Git", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file GMove lua require("packer.load")({'vim-fugitive'}, { cmd = "GMove", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file G lua require("packer.load")({'vim-fugitive'}, { cmd = "G", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
time([[Defining lazy-load commands]], false)

vim.cmd [[augroup packer_load_aucmds]]
vim.cmd [[au!]]
  -- Filetype lazy-loads
time([[Defining lazy-load filetype autocommands]], true)
vim.cmd [[au FileType fugitive ++once lua require("packer.load")({'vim-fugitive'}, { ft = "fugitive" }, _G.packer_plugins)]]
vim.cmd [[au FileType rs ++once lua require("packer.load")({'rust-tools.nvim'}, { ft = "rs" }, _G.packer_plugins)]]
vim.cmd [[au FileType rust ++once lua require("packer.load")({'rust-tools.nvim'}, { ft = "rust" }, _G.packer_plugins)]]
vim.cmd [[au FileType markdown ++once lua require("packer.load")({'glow.nvim'}, { ft = "markdown" }, _G.packer_plugins)]]
time([[Defining lazy-load filetype autocommands]], false)
  -- Event lazy-loads
time([[Defining lazy-load event autocommands]], true)
vim.cmd [[au BufRead * ++once lua require("packer.load")({'lsp_signature.nvim', 'dial.nvim', 'indent-blankline.nvim', 'nvim-lastplace', 'numb.nvim', 'nvim-bqf', 'nvim-spectre', 'hop.nvim'}, { event = "BufRead *" }, _G.packer_plugins)]]
vim.cmd [[au BufWinEnter * ++once lua require("packer.load")({'toggleterm.nvim'}, { event = "BufWinEnter *" }, _G.packer_plugins)]]
vim.cmd [[au BufNew * ++once lua require("packer.load")({'nvim-bqf'}, { event = "BufNew *" }, _G.packer_plugins)]]
vim.cmd [[au CursorMoved * ++once lua require("packer.load")({'vim-matchup'}, { event = "CursorMoved *" }, _G.packer_plugins)]]
vim.cmd [[au BufRead Cargo.toml ++once lua require("packer.load")({'crates.nvim'}, { event = "BufRead Cargo.toml" }, _G.packer_plugins)]]
time([[Defining lazy-load event autocommands]], false)
vim.cmd("augroup END")
vim.cmd [[augroup filetypedetect]]
time([[Sourcing ftdetect script at: /home/pudi3/.local/share/nvim/site/pack/packer/opt/vim-fugitive/ftdetect/fugitive.vim]], true)
vim.cmd [[source /home/pudi3/.local/share/nvim/site/pack/packer/opt/vim-fugitive/ftdetect/fugitive.vim]]
time([[Sourcing ftdetect script at: /home/pudi3/.local/share/nvim/site/pack/packer/opt/vim-fugitive/ftdetect/fugitive.vim]], false)
vim.cmd("augroup END")
if should_profile then save_profiles() end

end)

if not no_errors then
  vim.api.nvim_command('echohl ErrorMsg | echom "Error in packer_compiled: '..error_msg..'" | echom "Please check your config for correctness" | echohl None')
end
