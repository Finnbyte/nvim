-- Find out if Packer already installed.
-- Clone from Github if not.
local ensure_packer = function()
    local fn = vim.fn
    local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
    if fn.empty(fn.glob(install_path)) > 0 then
        fn.system({ "git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim", install_path })
        vim.cmd [[packadd packer.nvim]]
        return true
    end
    return false
end

local packer_bootstrap = ensure_packer()

require("packer").startup({
    function(use)
        -- Packer can manage it self
        use { "wbthomason/packer.nvim" }

        -- Undo history
        use { "mbbill/undotree" }

        -- Plugins I want only in a Linux environment
        if vim.fn.has("linux") or vim.fn.has("wsl") then
            use { "tribela/vim-transparent" } -- Transparent bg when using compositor
        end

        -- Looks
        use { "joshdick/onedark.vim" }
        use { "rose-pine/neovim" }
        use { "folke/tokyonight.nvim" }
        use { "catppuccin/nvim", as = "catppuccin" }

        -- Treesitter
        use { "nvim-treesitter/nvim-treesitter", run = ":TSUpdate" } -- Syntax highlighting
        use { "windwp/nvim-ts-autotag" } -- HTML tag closing using Treesitter

        -- LSP
        use {
            "williamboman/mason-lspconfig.nvim", -- Bridges gap between mason and LSP
            "williamboman/mason.nvim", -- Downloading language servers
            "neovim/nvim-lspconfig" }
        use { "hrsh7th/cmp-nvim-lsp" }
        use { "hrsh7th/cmp-buffer" }
        use { "hrsh7th/cmp-path" }
        use { "hrsh7th/cmp-cmdline" }
        use { "hrsh7th/nvim-cmp" }
        use { "onsails/lspkind.nvim" }
        use { "folke/trouble.nvim" }

        -- Mini.nvim (Extremely good collections of standalone functionalities)
        use { 'echasnovski/mini.nvim' }

        -- Snippets
        use { "L3MON4D3/LuaSnip" }
        use { "saadparwaiz1/cmp_luasnip" }
        use { "rafamadriz/friendly-snippets" }

        use { "rest-nvim/rest.nvim", requires = { { "nvim-lua/plenary.nvim" } } } -- REST requests inside vim
                use {
            "nvim-telescope/telescope.nvim", tag = "0.1.0",
            requires = { { "nvim-lua/plenary.nvim" } }
        }
        use { "lukas-reineke/indent-blankline.nvim" }
        use { "numToStr/Comment.nvim" } -- Extreme power over comments

        -- Git
        use { "tpope/vim-fugitive" }
        use { "kdheepak/lazygit.nvim" }
        use { "lewis6991/gitsigns.nvim" }

        -- File browser(s)
        use { "lambdalisue/fern.vim" }
        use { "tamago324/lir.nvim", requires = { { "nvim-lua/plenary.nvim" } } }

        -- Which key
        use { "folke/which-key.nvim" }

        -- Writing
        use { "junegunn/goyo.vim" }

        -- Discord
        use { "andweeb/presence.nvim" } -- Discord stuff :P

        -- Notetaking
        use { "vimwiki/vimwiki" } -- Personal wiki in Vim

        -- Utils
        use { "dstein64/vim-startuptime" } -- Profile startuptime better
        use { "jghauser/mkdir.nvim" } -- Create missing folders when saving files

        if packer_bootstrap then
            require("packer").sync()
        end
    end,
    -- display packer dialouge in the center in a floating window
    config = {
        display = {
            open_fn = require("packer.util").float,
        },
    },
})

-- # vim foldmethod=marker
