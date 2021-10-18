return require("packer").startup(function(use)
    use { 'wbthomason/packer.nvim' }
    
    -- Collection of common configurations for the Nvim LSP client
    use { 'neovim/nvim-lspconfig' }
    
    -- Completion framework
    use { 'hrsh7th/nvim-cmp',
    config = function()
	    require('core.cmp').setup()
    end
    }
    
    -- LSP completion source for nvim-cmp
    use { 'hrsh7th/cmp-nvim-lsp' }
    use { 'hrsh7th/cmp-nvim-lua' }
    
    -- Snippet completion source for nvim-cmp
    use { 'hrsh7th/cmp-vsnip' }
    use { 'hrsh7th/vim-vsnip' }
    
    -- Other usefull completion sources
    use { 'hrsh7th/cmp-path' }
    use { 'hrsh7th/cmp-buffer' }
    use { 'hrsh7th/cmp-calc' }
    use { 'hrsh7th/cmp-latex-symbols' }
    
    -- See hrsh7th's other plugins for more completion sources!
    
    -- To enable more of the features of rust-analyzer, such as inlay hints and more!
    use { 'simrat39/rust-tools.nvim',
    requires = { 'neovim/nvim-lspconfig' },
    config = function()
       require('core.rust-tools').setup()
   end,
   ft = { "rust", "rs" }, -- or you can not lazy load and remove this line
    }
    
    -- Fuzzy finder
    -- Optional
    use { 'nvim-lua/popup.nvim' }
    use { 'nvim-lua/plenary.nvim' }
    use { 'nvim-telescope/telescope.nvim' }
    
    -- Color scheme used in the GIFs!
    use { 'arcticicestudio/nord-vim' }

    -- dev: Auto reload config
    use { 'famiu/nvim-reload' }

    -- Fetch versions from crates.io
    use {
        "Saecki/crates.nvim",
    event = { "BufRead Cargo.toml" },
    requires = { { 'nvim-lua/plenary.nvim' } },
    config = function()
        require('crates').setup()
    end,
    }

    -- Language servers insteller
    use { 'williamboman/nvim-lsp-installer' } 

    -- Git 
    use { 'tpope/vim-fugitive' }

    -- Comments
    use { 'tpope/vim-commentary' }

     -- Add git related info in the signs columns and popups
    use { 'lewis6991/gitsigns.nvim', requires = { 'nvim-lua/plenary.nvim' } }

     -- Highlight, edit, and navigate code using a fast incremental parsing library
    use {
      "nvim-treesitter/nvim-treesitter",
      -- branch = "0.5-compat",
      -- run = ":TSUpdate",
      config = function()
        require("core.treesitter").setup()
      end,
    }
    -- Additional textobjects for treesitter
    use { 'nvim-treesitter/nvim-treesitter-textobjects' }

    -- File tree
    use {
    'kyazdani42/nvim-tree.lua',
    requires = 'kyazdani42/nvim-web-devicons',
    config = function() require('core.nvim-tree').setup()  end
    }
end)
