-- # Options # --
vim.cmd("filetype plugin on")
vim.cmd("syntax enable")

-- Leader key is Space
vim.g.mapleader = ' '

-- Line numbers (basically do hybrid)
vim.opt.rnu = true
vim.opt.nu = true

-- Looks
vim.opt.cursorline = true -- highlight line cursor is in

-- Splits
vim.opt.splitright = true
vim.opt.splitbelow = true

-- Text handling
vim.opt.expandtab = true   -- Use spaces instead of tabs
vim.opt.shiftwidth = 4     -- Shift 4 spaces when tab
vim.opt.tabstop = 4        -- 1 tab == 4 spaces
vim.opt.smartindent = true -- Autoindent new lines

-- backup/swap files
vim.opt.swapfile = false -- have files saved to swap
-- vim.opt.undofile = true	-- file undo history preserved outside current session

-- Folding
vim.opt.foldenable = false    -- Enable fold
vim.opt.foldmethod = "indent" -- Works for most languages, :help foldmethod

-- Statusline
vim.opt.laststatus = 3 -- Set global statusline
vim.opt.cmdheight = 1  -- Height of cmdline

-- Misc
vim.opt.tildeop = true        -- Make tilde an operator
vim.opt.fsync = false         -- Makes some systems slower
vim.opt.scrolloff = 5         -- Defines how many lines you see below and above cursor
vim.opt.title = true          -- Set window title for window manager/bar
vim.opt.hidden = true         -- Don't unload buffers, make them hidden
vim.opt.winborder = "rounded" -- Make window border rounded

-- Backup and swap file locations
-- Always using Linux so these can be non-conditionally hardcoded
vim.opt.backupdir = "/var/tmp,~/.tmp,."
vim.opt.directory = "/var/tmp,~/.tmp,."

vim.opt.wrap = true                           -- Wrap text when as long as width of window
vim.opt.showmatch = true                      -- Highlight matching parenthesis
vim.opt.ic = true                             -- Ignore lowercase for the whole pattern
vim.opt.hlsearch = false
vim.opt.incsearch = true                      -- Incremental search
vim.opt.linebreak = true                      -- Wrap on word boundary
vim.opt.history = 1000                        -- Remember N lines in history
vim.opt.lazyredraw = true                     -- Enable lazy redrawing functionality
vim.opt.timeoutlen = 700                      -- Faster timeout length

vim.keymap.set('n', '<F1>', ':set rnu!<CR>')  -- toggle relative line numbers
vim.keymap.set('n', '<F3>', ':set wrap!<CR>') -- toggle wrap

vim.keymap.set("n", "<leader>r", ":so ~/.config/nvim/init.lua<CR>")

vim.keymap.set("n", "0", "^")
vim.keymap.set("n", "^", "0")

-- Go up/down 1/2 screen without moving cursor
vim.keymap.set({ "n", "i", "t", "v" }, "<C-u>", "<C-u>zz")
vim.keymap.set({ "n", "i", "t", "v" }, "<C-d>", "<C-d>zz")

-- Switch windows
vim.keymap.set("n", "<C-c>", "<C-w>c")
vim.keymap.set("n", "<C-h>", "<C-w>h")
vim.keymap.set("n", "<C-j>", "<C-w>j")
vim.keymap.set("n", "<C-k>", "<C-w>k")
vim.keymap.set("n", "<C-l>", "<C-w>l")

-- Move lines up and down during visual mode
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- Go to normal mode in insert mode and terminal mode more easily
vim.keymap.set({ "i", "t" }, "jk", "<C-\\><C-n>")
vim.keymap.set({ "i", "t" }, "kj", "<C-\\><C-n>")

-- Source with <leader>o
vim.keymap.set({ "n" }, "<leader>o", ":update<CR> :source %<CR>")

-- Write with <leader>w
vim.keymap.set({ "n" }, "<leader>w", ":write<CR>")


-- # Plugins # --
vim.pack.add({ 
    "https://github.com/neovim/nvim-lspconfig",
    "https://github.com/tpope/vim-unimpaired",
    "https://github.com/tpope/vim-vinegar",
    "https://github.com/neanias/everforest-nvim",
    "https://github.com/stevearc/oil.nvim",
    "https://github.com/nvim-mini/mini.nvim",
    "https://github.com/lervag/vimtex",
    "https://github.com/rafamadriz/friendly-snippets",
    "https://github.com/nvim-mini/mini.completion",
})

-- Vimtex
vim.g.vimtex_view_method = "zathura"

-- Lsp
vim.lsp.enable({ "lua_ls", "eslint", "intelephense" })
vim.keymap.set({ "n", "v" }, "<leader>f", vim.lsp.buf.format) -- format via lsp
vim.keymap.set({ "n", "v" }, "<leader>e", vim.diagnostic.open_float) -- format via lsp

-- Themes
require("everforest").setup({
    background = "hard",
})
vim.cmd.colorscheme("everforest")

-- Oil (file browser)
require("oil").setup({
    default_file_explorer = false,
    columns = {
        -- "icon",
        "permissions",
        "size",
        "mtime",
    },
    keymaps = {
        ["cd"] = "actions.cd",
        ["."] = { "actions.cd", mode = "n" },
    }
})
vim.keymap.set("n", "<leader>.", function() vim.cmd.Oil() end, { noremap = true })
vim.keymap.set("n", "-", "<CMD>Oil<CR>", { desc = "Open parent directory" })
vim.api.nvim_create_user_command("Cfg", function() vim.cmd.Oil({ args = { vim.fn.stdpath("config") } }) end, {})
vim.api.nvim_create_user_command("Data", function() vim.cmd.Oil({ args = { vim.fn.stdpath("data") } }) end, {})

-- Mini
require("mini.pick").setup()
require("mini.tabline").setup({ show_icons = false })
require("mini.ai").setup()
require("mini.completion").setup()
require("mini.misc").setup()
require("mini.indentscope").setup()
require("mini.statusline").setup({ use_icons = false })
require("mini.hipatterns").setup({
    highlighters = {
        fixme     = { pattern = '%f[%w]()FIXME()%f[%W]', group = 'MiniHipatternsFixme' },
        hack      = { pattern = '%f[%w]()HACK()%f[%W]', group = 'MiniHipatternsHack' },
        todo      = { pattern = '%f[%w]()TODO()%f[%W]', group = 'MiniHipatternsTodo' },
        note      = { pattern = '%f[%w]()NOTE()%f[%W]', group = 'MiniHipatternsNote' },

        -- Highlight hex color strings (`#rrggbb`) using that color
        hex_color = require("mini.hipatterns").gen_highlighter.hex_color(),
    },
})
require("mini.move").setup()
require("mini.jump").setup()
require("mini.pairs").setup({
    modes = { insert = true, command = false, terminal = false },
    mappings = {
        ['('] = { action = 'open', pair = '()', neigh_pattern = '[^\\].' },
        ['['] = { action = 'open', pair = '[]', neigh_pattern = '[^\\].' },
        ['{'] = { action = 'open', pair = '{}', neigh_pattern = '[^\\].' },

        [')'] = { action = 'close', pair = '()', neigh_pattern = '[^\\].' },
        [']'] = { action = 'close', pair = '[]', neigh_pattern = '[^\\].' },
        ['}'] = { action = 'close', pair = '{}', neigh_pattern = '[^\\].' },

        ['"'] = { action = 'closeopen', pair = '""', neigh_pattern = '[^\\].', register = { cr = false } },
        ["'"] = { action = 'closeopen', pair = "''", neigh_pattern = '[^%a\\].', register = { cr = false } },
        ['`'] = { action = 'closeopen', pair = '``', neigh_pattern = '[^\\].', register = { cr = false } },
    },
})
require("mini.surround").setup({
    mappings = {
        add = 'ys',
        delete = 'ds',
        replace = 'cs',
        find = 'ysf',
        find_left = 'ysF',
        highlight = 'ysh',
        update_n_lines = 'ysn',
        suffix_last = 'l',
        suffix_next = 'n',
    }
})
require('mini.comment').setup({
    options = {
        ignore_blank_line = false,
        start_of_line = false,
    },
    mappings = {
        -- Normal and Visual modes
        comment = 'gc',
        -- Toggle comment on current line
        comment_line = 'gcc',
        textobject = 'gc',
    },
    hooks = {
        pre = function() end,
        post = function() end,
    },
})

local latex_patterns = { 'latex/**/*.json', '**/latex.json' }
local lang_patterns = {
    tex = latex_patterns, plaintex = latex_patterns,
    -- Recognize special injected language of markdown tree-sitter parser
    markdown_inline = { 'markdown.json' },
}
local gen_loader = require('mini.snippets').gen_loader
require('mini.snippets').setup({
  snippets = {
    gen_loader.from_file('~/.config/nvim/snippets/global.json'),
    gen_loader.from_lang({}),
    gen_loader.from_lang({ lang_patterns = lang_patterns }),
  },
})

local pick = require("mini.pick")
pick.setup()
vim.keymap.set("n", "<leader>f,", function()
    local success = pcall(pick.builtin.files({ tool = "git" }))
    if not success then
        print("You need to be in a directory with .git/ for builtin.git_files!")
    end
end)
vim.keymap.set("n", "<leader>f.", function() pick.builtin.files({ tool = "fd" }) end)
-- vim.keymap.set("n", "<leader>fr", builtin.oldfiles)
vim.keymap.set("n", "<leader>fg", pick.builtin.grep_live)
vim.keymap.set("n", "<leader>/", function() pick.builtin.grep_live({ globs = { vim.fn.expand("%:p") } }) end)
vim.keymap.set("n", "<leader><leader>", pick.builtin.buffers)
vim.keymap.set("n", "<leader>h", pick.builtin.help)
-- vim.keymap.set("n", "<leader>:", builtin.commands)
--
vim.api.nvim_create_autocmd('LspAttach', {
    group = vim.api.nvim_create_augroup('my.lsp', {}),
    callback = function(args)
        local client = assert(vim.lsp.get_client_by_id(args.data.client_id))
        if client:supports_method('textDocument/implementation') then
            -- Create a keymap for vim.lsp.buf.implementation ...
            vim.keymap.set("n", 'K', vim.lsp.buf.hover)
            vim.keymap.set("n", 'gD', vim.lsp.buf.declaration)
            vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float)
            -- Not using telescope so commented out
            -- vim.keymap.set("n", 'gd', require('telescope.builtin').lsp_definitions)
            -- vim.keymap.set("n", 'gr', require('telescope.builtin').lsp_references)
            -- vim.keymap.set("n", 'gI', require('telescope.builtin').lsp_implementations)
            -- vim.keymap.set("n", '<leader>D', require('telescope.builtin').lsp_type_definitions)
            -- vim.keymap.set("n", '<leader>ds', require('telescope.builtin').lsp_document_symbols)
            -- vim.keymap.set("n", '<leader>ws', require('telescope.builtin').lsp_dynamic_workspace_symbols)
            vim.keymap.set("n", '<leader>rn', function() vim.lsp.buf.rename() end)
            vim.keymap.set("n", '<leader>ff', function() vim.lsp.buf.format { async = true } end)
            vim.keymap.set("n", '<leader>ca', function() vim.lsp.buf.code_action() end)
        end
        if client:supports_method('textDocument/completion') then
            vim.lsp.completion.enable(true, client.id, args.buf, { autotrigger = false })
        end
        -- Auto-format ("lint") on save.
        -- Usually not needed if server supports "textDocument/willSaveWaitUntil".
        -- if not client:supports_method('textDocument/willSaveWaitUntil')
        --     and client:supports_method('textDocument/formatting') then
        --     vim.api.nvim_create_autocmd('BufWritePre', {
        --         group = vim.api.nvim_create_augroup('my.lsp', { clear = false }),
        --         buffer = args.buf,
        --         callback = function()
        --             vim.lsp.buf.format({ bufnr = args.buf, id = client.id, timeout_ms = 1000 })
        --         end,
        --     })
        -- end
    end,
})

vim.api.nvim_create_autocmd({ "BufEnter" }, {
    pattern = "*.twig",
    callback = function ()
        vim.cmd("set filetype=html")
    end
})

-- Fix errors when saving a javascript/typescript file
-- local eslint_fix_group = vim.api.nvim_create_augroup("Eslint", { clear = true })
-- vim.api.nvim_create_autocmd({ "BufWritePost" }, {
--     pattern = { "*.ts", "*.js", "*.tsx", "*.jsx" },
--     group = eslint_fix_group,
--     callback = function()
--         local ok, _ = pcall(vim.cmd.EslintFixAll)
--         if ok then
--             vim.cmd.write() -- Save changes again after fixed errors
--         end
--     end
-- })
--

