-- Find out if Packer already installed.
-- Clone from Github if not.
local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
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

        -- Looks
        use { "tribela/vim-transparent" } -- Transparent bg when using compositor
        use { "joshdick/onedark.vim" }
        use { "rose-pine/neovim" }
        use { "folke/tokyonight.nvim" }

        -- IDE features
        use { "nvim-treesitter/nvim-treesitter", run = ":TSUpdate" } -- Syntax highlighting
        -- use { 'ms-jpq/coq_nvim', branch = 'coq' } -- Fast completion
        -- use { 'ms-jpq/coq.artifacts', branch = 'artifacts' } -- Fast completion

        use { 'hrsh7th/cmp-nvim-lsp' }
        use { 'hrsh7th/cmp-buffer' }
        use { 'hrsh7th/cmp-path' }
        use { 'hrsh7th/cmp-cmdline' }
        use { 'hrsh7th/nvim-cmp' }

        -- Snippets
        use { 'hrsh7th/cmp-vsnip' }
        use { 'hrsh7th/vim-vsnip' }


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
        use { "numToStr/Comment.nvim" } -- Extreme power over comments 

        -- Git
        use { "tpope/vim-fugitive" }
        use { "TimUntersberger/neogit" } -- Magit-style git status
        use { "lewis6991/gitsigns.nvim" } -- Show git stuff on the left

        -- File browser(s)
        use { "nvim-neo-tree/neo-tree.nvim", branch = "v2.x", requires = { "nvim-lua/plenary.nvim", "MunifTanjim/nui.nvim" }}
        use { "nvim-telescope/telescope-file-browser.nvim" }
        use { 'nvim-tree/nvim-tree.lua' }
        use { 'preservim/nerdtree' }

        -- Which key
        use { "folke/which-key.nvim" }

        -- Dashboard
        use { "mhinz/vim-startify" }

        -- Writing
        use { "junegunn/goyo.vim" }

        -- Misc Tim Pope
        use { "tpope/vim-endwise" } -- Automatic ends (e.g endif) to conditions
        use { "tpope/vim-projectionist" } -- Magic stuff
        use { "tpope/vim-surround" } -- Change surrounding quotes / parens easily

        -- Discord
        use { "andweeb/presence.nvim" } -- Discord stuff :P

        -- Statusline
        use { 'nvim-lualine/lualine.nvim' }

        use { "windwp/nvim-autopairs" } -- Pairings
        use { "vimwiki/vimwiki" } -- Personal wiki in Vim
        use { "easymotion/vim-easymotion" } -- Navigate characters
        use { "jlanzarotta/bufexplorer" } -- Switch between open buffers

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
