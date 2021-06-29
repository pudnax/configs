vim.g.mapleader = ' '
vim.g.maplocalleader = ','

require('settings')

-----------------------------
-- NeoVim Function Binding --
-----------------------------
local execute = vim.api.nvim_command
local fn = vim.fn

-------------------
-- Load Packages --
-------------------

-- Make sure packer is installed before executing the rest of the script
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'

local packer_install = 0
if fn.empty(fn.glob(install_path)) > 0 then
  fn.system({'git', 'clone', 'https://github.com/wbthomason/packer.nvim', install_path})
  execute 'packadd packer.nvim'
  packer_install = 1
else
  vim.cmd [[packadd packer.nvim]]
end

vim.api.nvim_exec([[
  augroup Packer
    autocmd!
    autocmd BufWritePost init.lua PackerCompile
  augroup end
]], false)

local packer = require('packer')

require('plugins')

if packer_install == 1 then
  vim.cmd 'PackerInstall'
end
--------------------

require('keymapping')

require('config')

require('lserver')
