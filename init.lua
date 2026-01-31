-- require("setup-plugins")
-- require("core/formatting")

-- # Options # --

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
vim.opt.tildeop = true -- Make tilde an operator
vim.opt.fsync = false  -- Makes some systems slower
vim.opt.scrolloff = 5  -- Defines how many lines you see below and above cursor
vim.opt.title = true   -- Set window title for window manager/bar
vim.opt.hidden = true  -- Don't unload buffers, make them hidden

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

-- # Plugins # --
vim.pack.add({ "https://github.com/neanias/everforest-nvim" })
vim.cmd.colorscheme("everforest")
vim.pack.add({ "https://github.com/stevearc/oil.nvim" })
require("oil").setup({
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
vim.pack.add({ "https://github.com/nvim-mini/mini.nvim" })
require("mini.pick").setup()
require("mini.tabline").setup({ show_icons = false })
require("mini.ai").setup()
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

-- Disable annoying commentting
local annoying_comments_group = vim.api.nvim_create_augroup("Comments", { clear = true })
vim.api.nvim_create_autocmd({ "BufEnter" }, {
	command = "set formatoptions-=cro",
	group = annoying_comments_group
})

-- Fix errors when saving a javascript/typescript file
local eslint_fix_group = vim.api.nvim_create_augroup("Eslint", { clear = true })
vim.api.nvim_create_autocmd({ "BufWritePost" }, {
	pattern = { "*.ts", "*.js", "*.tsx", "*.jsx" },
	group = eslint_fix_group,
	callback = function()
		local ok, _ = pcall(vim.cmd.EslintFixAll)
		if ok then
			vim.cmd.write() -- Save changes again after fixed errors
		end
	end
})
