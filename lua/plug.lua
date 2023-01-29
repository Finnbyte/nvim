require("packer").startup({
    function(use)
        -- Packer can manage it self
        use { "wbthomason/packer.nvim" }

        -- Looks
        use { "tribela/vim-transparent" } -- Transparent bg when using compositor
        use { "joshdick/onedark.vim" }
        use { "rose-pine/neovim" }
        use { "folke/tokyonight.nvim" }
        -- use { "sheerun/vim-polyglot" } -- Syntax for loads of languages

        -- IDE feature
        use { "nvim-treesitter/nvim-treesitter", run = ":TSUpdate" } -- Syntax highlighting
        use { 'ms-jpq/coq_nvim', branch = 'coq' } -- Fast completion
        use { 'ms-jpq/coq.artifacts', branch = 'artifacts' } -- Fast completion
        use { "rest-nvim/rest.nvim" } -- REST requests inside vim
        use {
            "williamboman/mason-lspconfig.nvim", -- Bridges gap between mason and LSP
            "williamboman/mason.nvim", -- Downloading language servers
            "neovim/nvim-lspconfig" } -- LSP

        use {
            'nvim-telescope/telescope.nvim', tag = '0.1.0',
            -- or                            , branch = '0.1.x',
            requires = { {'nvim-lua/plenary.nvim'} }
        }
        use { "lukas-reineke/indent-blankline.nvim" }

        -- Git
        use { "tpope/vim-fugitive" }

        -- File browser(s)
        -- Unless you are still migrating, remove the deprecated commands from v1.x
        -- vim.g.neo_tree_remove_legacy_commands = 1

        use {
            "nvim-neo-tree/neo-tree.nvim",
            branch = "v2.x",
            requires = {
                "nvim-lua/plenary.nvim",
                "MunifTanjim/nui.nvim"
            }
        }

        use { "nvim-telescope/telescope-file-browser.nvim" }
        use { 'nvim-tree/nvim-tree.lua' }

        use { "folke/which-key.nvim" }

        -- Dashboard
        use { "mhinz/vim-startify" }

        -- Writing
        use { "junegunn/goyo.vim" }

        -- Tim Pope
        use { "tpope/vim-endwise" } -- Automatic ends (e.g endif) to conditions
        use { "tpope/vim-projectionist" } -- Magic stuff
        -- use { "tpope/vim-repeat" } -- Repeat commands with .
        -- use { "tpope/vim-sensible" } -- Sensible defaults
        use { "tpope/vim-surround" } -- Change surrounding quotes / parens easily

        use { "andweeb/presence.nvim" } -- Discord stuff :P

        use { 'nvim-lualine/lualine.nvim' }

        use { "scrooloose/nerdcommenter" } -- Extreme power over comments 
        -- use { "scrooloose/nerdtree" } -- File browser

        -- use { "jbyuki/quickmath.nvim" }
        use { "windwp/nvim-autopairs" }
        use { "vimwiki/vimwiki" } -- Personal wiki in Vim
        use { "easymotion/vim-easymotion" } -- Navigate characters
        use { "airblade/vim-gitgutter" } -- Show git stuff on the left
        use { "jlanzarotta/bufexplorer" } -- Switch between open buffers
        use { "kien/ctrlp.vim" } -- Fuzzy search
        use { "ludovicchabant/vim-gutentags" } -- Autogenerate ctags
        use { "mileszs/ack.vim" } -- Search through project
    end,
        -- display packer dialouge in the center in a floating window
        config = {
            display = {
                open_fn = require("packer.util").float,
            },
        },
    })

    -- # vim foldmethod=marker
