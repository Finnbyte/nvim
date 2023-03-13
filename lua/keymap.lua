-- Helper functions (available globally by design)
function Map(mode, shortcut, command)
  vim.keymap.set(mode, shortcut, command, { noremap = true, silent = true })
end

function BufMap(mode, shortcut, command)
  vim.keymap.set(mode, shortcut, command, { noremap = true, silent = true, buffer = 0 })
end

function Unmap(mode, bind)
	vim.api.nvim_del_keyMap(mode, bind)
end

vim.g.mapleader = ' ' -- Map leader key to space
-- Set <leader> key

Map('n', '<F1>', ':set rnu!<CR>') -- toggle relative line numbers
Map("n", "<F2>", ":nohlsearch<CR>") -- Disable highlighted entries
Map('n', '<F3>', ':set wrap!<CR>') -- toggle wrap 

Map("n", "0", "^")
Map("n", "^", "0")

-- Resize splits
-- Map({"n", "i", "t"}, "<C-Right>", vim.cmd([[resize +10]]))
-- Map({"n", "i", "t"}, "<C-Left", vim.cmd([[resize -10]]))
-- Map({"n", "i", "t"}, "<C-Up", vim.cmd([[vertical resize +10]]))
-- Map({"n", "i", "t"}, "<C-Down>", vim.cmd([[vertical resize -10]]))

-- Go up/down 1/2 screen without moving cursor
Map({"n", "i", "t", "v"}, "<C-u>", "<C-u>zz")
Map({"n", "i", "t", "v"}, "<C-d>", "<C-d>zz")

-- Switch windows
Map("n", "<C-c>", "<C-w>c")
Map("n", "<C-h>", "<C-w>h")
Map("n", "<C-j>", "<C-w>j")
Map("n", "<C-k>", "<C-w>k")
Map("n", "<C-l>", "<C-w>l")
