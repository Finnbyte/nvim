local cmd = vim.cmd
local fn = vim.fn
local opt = vim.opt
local g = vim.g
local o = vim.o

-- Leader key is Space
vim.g.mapleader = ' '

-- Line numbers (basically do hybrid)
opt.rnu = true
opt.nu = true

-- Looks
o.cursorline = true 	-- highlight line cursor is in

-- Looks in Neovide (my preferred GUI client)
if g.neovide then
    g.neovide_transparency = 1.0
	-- Disable too blingy graphical effects
	g.neovide_cursor_animation_length = 0
	g.neovide_cursor_trail_size = 0
	-- QoL
	g.neovide_confirm_quit = true
end

-- Splits
opt.splitright = true
opt.splitbelow = true

-- Text handling
opt.expandtab = true -- Use spaces instead of tabs
opt.shiftwidth = 4 -- Shift 4 spaces when tab
opt.tabstop = 4 -- 1 tab == 4 spaces
opt.smartindent = true -- Autoindent new lines

-- backup/swap files
opt.swapfile = false  	-- have files saved to swap
-- opt.undofile = true	-- file undo history preserved outside current session

-- Folding
opt.foldenable = false -- Enable fold
opt.foldmethod = "indent" -- Works for most languages, :help foldmethod

-- Statusline
opt.laststatus = 3 -- Set global statusline
opt.cmdheight = 1 -- Height of cmdline

-- Misc
opt.tildeop = true -- Make tilde an operator
opt.fsync = false -- Makes some systems slower
opt.scrolloff = 5 -- Defines how many lines you see below and above cursor
opt.title = true -- Set window title for window manager/bar
opt.hidden = true -- Don't unload buffers, make them hidden

if vim.fn.has("linux") == 1 then
    opt.backupdir = "/var/tmp,~/.tmp,."
    opt.directory = "/var/tmp,~/.tmp,."
end

opt.wrap = true -- Wrap text when as long as width of window
opt.showmatch = true -- Highlight matching parenthesis
opt.ic = true -- Ignore lowercase for the whole pattern
opt.incsearch = true -- Incremental search
opt.linebreak = true -- Wrap on word boundary
opt.history = 1000 -- Remember N lines in history
opt.lazyredraw = true -- Enable lazy redrawing functionality
opt.timeoutlen = 700 -- Faster timeout length

-- Set shell on Windows to be powershell, better commands (rm/ls.. etc.)
-- if fn.has("win64") then
--     g.shell = fn.executable('pwsh') and 'pwsh' or 'powershell'
--     g.shellcmdflag = '-NoLogo -NoProfile -ExecutionPolicy RemoteSigned -Command [Console]::InputEncoding=[Console]::OutputEncoding=[System.Text.Encoding]::UTF8;'
--     g.shellredir = '2>&1 | Out-File -Encoding UTF8 %s; exit $LastExitCode'
--     g.shellpipe = '2>&1 | Out-File -Encoding UTF8 %s; exit $LastExitCode'
-- end

