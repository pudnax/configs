return require('packer').startup(function()
    -- Packer can manage itself as an optional plugin
    use { 'wbthomason/packer.nvim', opt = true }

      -- Config
    use {
        'dstein64/vim-startuptime',
        cmd = 'StartupTime',
        config = [[vim.g.startuptime_tries = 10]]
    }

    -- Development
    use {'tpope/vim-fugitive'}

    use {
        'TimUntersberger/neogit',
        config = function()
            require('neogit').setup {integrations = {diffview = true}}
        end
    }
    use {'sindrets/diffview.nvim'}

    use {'kyazdani42/nvim-web-devicons'}
    use {'sainnhe/gruvbox-material'}

    -- Tree
    use {'kyazdani42/nvim-tree.lua'}

    -- Hex colors
    use {'norcalli/nvim-colorizer.lua'}

    -- Telescope
    use {'nvim-lua/plenary.nvim'}
    use {'nvim-lua/popup.nvim'}
    use {'nvim-telescope/telescope.nvim'}
    use {
        'nvim-telescope/telescope-frecency.nvim',
        requires = {'tami5/sql.nvim'},
        config = function()
            require('telescope').load_extension('frecency')
        end
    }
    use {'nvim-telescope/telescope-symbols.nvim'}
    use {'nvim-telescope/telescope-github.nvim'}
    -- use {
    --     'nvim-telescope/telescope-arecibo.nvim',
    --     rocks = {"openssl", "lua-http-parser"}
    -- }
    use { 'nvim-telescope/telescope-media-files.nvim' }
    -- use { 'nvim-telescope/telescope-packer.nvim ' }

    -- LSP config
    use {'neovim/nvim-lspconfig'}

    -- Completion - use either one of this
    use {'hrsh7th/nvim-compe'}

    -- Better LSP experience
    use {'szw/vim-maximizer'}
    use {'sbdchd/neoformat'}
    use {'ray-x/lsp_signature.nvim'}
    use {'dyng/ctrlsf.vim'}
    use {
        "folke/trouble.nvim",
        config = function() require("trouble").setup {} end
    }

    -- Rust
    use {'simrat39/rust-tools.nvim'}

    -- Better syntax
    use {'nvim-treesitter/nvim-treesitter', run = ':TSUpdate'}

    -- Status line
    --use {
    --    'glepnir/galaxyline.nvim',
    --    branch = 'main',
    --    config = function() require 'statusline' end
    --}

    -- Telescope fzf
    use {'nvim-telescope/telescope-fzf-native.nvim', run = 'make'}

    -- use {'norcalli'nvim-colorizer.lua'}
end)
